#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/Pass.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_os_ostream.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/Transforms/Utils/ModuleUtils.h>
#include <map>
#include <string>
using namespace llvm;
namespace {
	struct dynamicBBPass : public FunctionPass {
		Function* writeFunction;
		Function* addFunction;
		GlobalVariable* BBNumsGlobal;
		GlobalVariable* BBExecTableGlobal;
		//std::map<std::string, Value*> globalValueMap;
		static char ID;
		int count = 0;
		dynamicBBPass() : FunctionPass(ID) {}
		bool doInitialization(Module &M) override {

			auto& context = M.getContext();
			IRBuilder<> builder(context);
			//为每一个Block命名，命名规则为block所在的函数名_bcount
			for (auto &F : M) {
				for (auto &BB : F) {
					if (!BB.hasName()) {
						BB.setName(std::to_string(count++));
						errs() << BB.getName() << "\n";
						//globalValueMap[BB.getName()] = builder.CreateGlobalStringPtr(BB.getName());
					}
				}
			}

			//初始化给basicblock计数的全局变量
			auto int32Ty = Type::getInt32Ty(context);
			auto bbcountGlobal = ConstantInt::get(int32Ty, 0, true);
			BBNumsGlobal = new GlobalVariable(
				M,
				int32Ty,
				false, //是否是常量
				GlobalValue::ExternalLinkage,
				bbcountGlobal,
				"CaLlCoUnTeR_BBNums"
			);

			//初始化给全局存储BasicBlock执行顺序的列表
			//auto* stringTy = Type::getInt8PtrTy(context);
			auto* tableTy = ArrayType::get(int32Ty, 4096);
			std::vector<Constant*> values;
			for (int i = 0; i < 4096; i++)
				values.push_back(bbcountGlobal);

			auto* functionTable = ConstantArray::get(tableTy, values);
			BBExecTableGlobal = new GlobalVariable(
				M,
				tableTy,
				false,
				GlobalValue::ExternalLinkage,
				functionTable,
				"CaLlCoUnTeR_table"
			);

			//添加函数
			writeFunction = cast<Function>(M.getOrInsertFunction("CaLlCoUnTeR_write", Type::getVoidTy(context), nullptr));
			auto* helperTy = FunctionType::get(Type::getVoidTy(context), Type::getInt32Ty(context), false);
			addFunction = cast<Function>(M.getOrInsertFunction("CaLlCoUnTeR_add1", helperTy));
			//appendToGlobalDtors(M, llvm::cast<Function>(addFunction), 0);
		}

		bool doFinalization(Module &M) override {
			return false;
		}
		bool runOnFunction(Function &F) override {
			for (auto &BB : F) {
				IRBuilder<> builder(&*BB.getFirstInsertionPt());
				auto *constint = builder.getInt32(std::stoi(BB.getName()));
				builder.CreateCall(addFunction, constint);
				if (F.getName().equals("main") && isa<ReturnInst>(BB.getTerminator())) {
					builder.CreateCall(writeFunction);
				}
			}
		}
	};
}

char dynamicBBPass::ID = 0;

static RegisterPass<dynamicBBPass> X("pathProfiling", "dynamic Block path profiling", false, false);

