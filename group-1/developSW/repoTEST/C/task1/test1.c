#include <stdio.h>
#include "util.h"

extern int add(int a, int b);

int main()
{
    int res, testFail = 0;
    for (int i = -10; i < 5; i++)
    {
        res = add(i,5);
        if (res != (i + 5))
        {
            fprintf(stderr, "%i + 5 don't equal %i!\n", i, i + 5);
            testFail = 1;
        }
    }
    return testFail;
}
