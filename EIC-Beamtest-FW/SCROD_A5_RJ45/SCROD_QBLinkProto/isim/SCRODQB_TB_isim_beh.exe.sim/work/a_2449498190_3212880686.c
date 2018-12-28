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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_QBLinkProto/SCRODQB_Top.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2449498190_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(82, ng0);

LAB3:    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 8504);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 8376);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2449498190_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(83, ng0);

LAB3:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 8568);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 8392);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2449498190_3212880686_p_2(char *t0)
{
    char t10[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB6, &&LAB7, &&LAB8};

LAB0:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 3712U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(169, ng0);
    t1 = (t0 + 5672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB2:    xsi_set_current_line(167, ng0);
    t3 = (t0 + 5832U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 8632);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB5:    t1 = (t0 + 8408);
    *((int *)t1) = 1;

LAB1:    return;
LAB6:    xsi_set_current_line(171, ng0);
    t4 = (t0 + 8696);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(172, ng0);
    t1 = (t0 + 8760);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(173, ng0);
    t1 = (t0 + 8824);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(174, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t3 = t1;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 8888);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(175, ng0);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB9;

LAB11:    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB12;

LAB13:
LAB10:    goto LAB5;

LAB7:    xsi_set_current_line(186, ng0);
    t1 = (t0 + 8760);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(187, ng0);
    t1 = (t0 + 9016);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB8:    xsi_set_current_line(190, ng0);
    t1 = (t0 + 8824);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(191, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 15788U);
    t4 = (t0 + 15965);
    t7 = (t10 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 31;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t11 = (31 - 0);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t12;
    t2 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t1, t4, t10);
    if (t2 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(194, ng0);
    t1 = (t0 + 9016);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB15:    goto LAB5;

LAB9:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 8696);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(177, ng0);
    t1 = (t0 + 8952);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(178, ng0);
    t1 = (t0 + 9016);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(179, ng0);
    t1 = (t0 + 15933);
    t4 = (t0 + 8888);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast(t4);
    goto LAB10;

LAB12:    xsi_set_current_line(181, ng0);
    t1 = (t0 + 8696);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(182, ng0);
    t1 = (t0 + 8952);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(183, ng0);
    t1 = (t0 + 9016);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB10;

LAB14:    xsi_set_current_line(192, ng0);
    t8 = (t0 + 9016);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)0;
    xsi_driver_first_trans_fast(t8);
    goto LAB15;

}

static void work_a_2449498190_3212880686_p_3(char *t0)
{
    char t18[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned int t19;

LAB0:    xsi_set_current_line(203, ng0);
    t1 = (t0 + 3552U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(206, ng0);
    t1 = (t0 + 5992U);
    t3 = *((char **)t1);
    t1 = (t0 + 15997);
    t9 = xsi_mem_cmp(t1, t3, 2U);
    if (t9 == 1)
        goto LAB6;

LAB10:    t5 = (t0 + 15999);
    t10 = xsi_mem_cmp(t5, t3, 2U);
    if (t10 == 1)
        goto LAB7;

LAB11:    t7 = (t0 + 16001);
    t11 = xsi_mem_cmp(t7, t3, 2U);
    if (t11 == 1)
        goto LAB8;

LAB12:
LAB9:    xsi_set_current_line(226, ng0);
    t1 = (t0 + 9144);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(227, ng0);
    t1 = (t0 + 9208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB5:    t1 = (t0 + 8424);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(204, ng0);
    t3 = (t0 + 6152U);
    t4 = *((char **)t3);
    t3 = (t0 + 9080);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 2U);
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

LAB6:    xsi_set_current_line(208, ng0);
    t12 = (t0 + 9144);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 9208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(210, ng0);
    t1 = (t0 + 3912U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)3);
    if (t17 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB5;

LAB7:    xsi_set_current_line(214, ng0);
    t1 = (t0 + 9144);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(215, ng0);
    t1 = (t0 + 9208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(216, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t17 = (t2 == (unsigned char)3);
    if (t17 != 0)
        goto LAB17;

LAB19:
LAB18:    goto LAB5;

LAB8:    xsi_set_current_line(220, ng0);
    t1 = (t0 + 9144);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(221, ng0);
    t1 = (t0 + 9208);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(222, ng0);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 15788U);
    t4 = (t0 + 16007);
    t6 = (t18 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 31;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t9 = (31 - 0);
    t19 = (t9 * 1);
    t19 = (t19 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t19;
    t2 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t1, t4, t18);
    if (t2 != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB5;

LAB13:;
LAB14:    xsi_set_current_line(211, ng0);
    t1 = (t0 + 16003);
    t5 = (t0 + 9272);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB15;

LAB17:    xsi_set_current_line(217, ng0);
    t1 = (t0 + 16005);
    t5 = (t0 + 9272);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t1, 2U);
    xsi_driver_first_trans_fast(t5);
    goto LAB18;

LAB20:    xsi_set_current_line(223, ng0);
    t7 = (t0 + 16039);
    t12 = (t0 + 9272);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 2U);
    xsi_driver_first_trans_fast(t12);
    goto LAB21;

}


extern void work_a_2449498190_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2449498190_3212880686_p_0,(void *)work_a_2449498190_3212880686_p_1,(void *)work_a_2449498190_3212880686_p_2,(void *)work_a_2449498190_3212880686_p_3};
	xsi_register_didat("work_a_2449498190_3212880686", "isim/SCRODQB_TB_isim_beh.exe.sim/work/a_2449498190_3212880686.didat");
	xsi_register_executes(pe);
}
