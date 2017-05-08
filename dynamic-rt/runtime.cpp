#include <stdio.h>
#include <stdlib.h>
#include <cstdint>
extern "C" {

    #define CCOUNT(X) CaLlCoUnTeR_##X
	extern uint32_t CCOUNT(BBNums);
	extern uint32_t CCOUNT(table)[];
	void CCOUNT(write)() {
		FILE* fp;
		if ((fp = fopen("BBprofiling.txt", "a+")) == NULL) {
			fp = fopen("BBprofiling.txt", "w+");
		}
		for (int i = 0; i < CCOUNT(BBNums); i++) {
			fprintf(fp, "%d\n", CCOUNT(table)[i]);
		}
		fclose(fp);
	}
	void CCOUNT(add1)(uint32_t name) {
		CCOUNT(table)[CCOUNT(BBNums)++] = name;
		if (CCOUNT(BBNums) == 4096) {
			CCOUNT(write)();
			CCOUNT(BBNums) = 0;
		}
	}
	
}
