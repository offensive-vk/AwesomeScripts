// Fastest Way to get a segmentation fault using gcc

#include <stdio.h>
#include <stdlib.h>
 
int main(void)
{
    int* p = (int*)malloc(8);
    *p = 100;
    free(p);
    *p = 110;
    printf("%d", *p); 
    return 0;
}
