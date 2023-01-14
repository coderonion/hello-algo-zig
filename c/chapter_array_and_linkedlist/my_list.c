/**
 * File: my_list.c
 * Created Time: 2023-01-08
 * Author: sjinzh (sjinzh@gmail.com)
 */

#include "../include/include.h"

// 列表类简易实现
typedef struct MyList {
    int *nums;
    unsigned int numsCapacity;
    unsigned int numSize;
    unsigned int extendRatio;
    struct MyList *(*init)();
    void (*deinit)();
    unsigned int (*size)();
    unsigned int (*capacity)();
    int (*get)(unsigned int index);
    void (*set)(unsigned int index, int num);
    void (*add)(int num);
    void (*insert)(unsigned int index, int num);
    int (*remove)(unsigned int index);
    void (*extendCapacity)();
} MyList;


/* Driver Code */
int main(int argc, char *argv[]) {

    MyList list = {
        NULL,
        10,
        0,
        2,
        

    };

    getchar();
    return 0;
}
