/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif



int xilinxcorelib_a_2637840722_3212880686_sub_4179278578_3057020925(char *t1, int t2)
{
    char t4[8];
    int t0;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;

LAB0:    t5 = (t4 + 4U);
    *((int *)t5) = t2;
    t7 = (t2 == 0);
    if (t7 == 1)
        goto LAB5;

LAB6:    t8 = (t2 == 1);
    t6 = t8;

LAB7:    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    t0 = 1;

LAB1:    return t0;
LAB2:    t0 = 0;
    goto LAB1;

LAB5:    t6 = (unsigned char)1;
    goto LAB7;

LAB8:    goto LAB3;

LAB9:;
}


extern void xilinxcorelib_a_2637840722_3212880686_init()
{
	static char *se[] = {(void *)xilinxcorelib_a_2637840722_3212880686_sub_4179278578_3057020925};
	xsi_register_didat("xilinxcorelib_a_2637840722_3212880686", "isim/cmdInerpreter_TB_isim_beh.exe.sim/xilinxcorelib/a_2637840722_3212880686.didat");
	xsi_register_subprogram_executes(se);
}
