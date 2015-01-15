#include "svdpi.h"
#include "dpiheader.h"

int c_task(int i, int *o)
{
    printf("Hello from c_task()\n");
    verilog_task(i, o);
    *o = i;
    return(0);
}
