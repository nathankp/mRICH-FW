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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/QBLink/QBlink/ipcore_dir/clockgen_bytelink.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2570266795_0912031422_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(105, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5800);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 5688);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2570266795_0912031422_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(152, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5864);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5704);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2570266795_0912031422_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    int t10;
    unsigned char t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(158, ng0);
    t1 = (t0 + 1632U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(161, ng0);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    if (t8 == 1)
        goto LAB11;

LAB12:    t5 = (t0 + 2952U);
    t9 = *((char **)t5);
    t10 = *((int *)t9);
    t11 = (t10 > 0);
    t4 = t11;

LAB13:    if (t4 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t10 = *((int *)t5);
    t1 = (t0 + 3888U);
    t6 = *((char **)t1);
    t13 = *((int *)t6);
    t2 = (t10 >= t13);
    if (t2 != 0)
        goto LAB14;

LAB15:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(163, ng0);
    t5 = (t0 + 5928);
    t17 = (t5 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t10 = *((int *)t5);
    t13 = (t10 + 1);
    t1 = (t0 + 5992);
    t6 = (t1 + 56U);
    t9 = *((char **)t6);
    t12 = (t9 + 56U);
    t14 = *((char **)t12);
    *((int *)t14) = t13;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    t5 = (t0 + 2952U);
    t12 = *((char **)t5);
    t13 = *((int *)t12);
    t5 = (t0 + 3888U);
    t14 = *((char **)t5);
    t15 = *((int *)t14);
    t16 = (t13 < t15);
    t3 = t16;
    goto LAB10;

LAB11:    t4 = (unsigned char)1;
    goto LAB13;

LAB14:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 5992);
    t9 = (t1 + 56U);
    t12 = *((char **)t9);
    t14 = (t12 + 56U);
    t17 = *((char **)t14);
    *((int *)t17) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(167, ng0);
    t1 = (t0 + 5928);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

}


extern void work_a_2570266795_0912031422_init()
{
	static char *pe[] = {(void *)work_a_2570266795_0912031422_p_0,(void *)work_a_2570266795_0912031422_p_1,(void *)work_a_2570266795_0912031422_p_2};
	xsi_register_didat("work_a_2570266795_0912031422", "isim/TriggerTB_isim_beh.exe.sim/work/a_2570266795_0912031422.didat");
	xsi_register_executes(pe);
}
