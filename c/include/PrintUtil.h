#include "stdio.h"
#include "stdlib.h"

/* Print an Array */
void printArray(int *nums, int n) {
    printf("[");
    for (int i = 0; i < n - 1; i++) {
        printf("%d, ", nums[i]);
    }
    printf("%d]\n", nums[n-1]);
}
