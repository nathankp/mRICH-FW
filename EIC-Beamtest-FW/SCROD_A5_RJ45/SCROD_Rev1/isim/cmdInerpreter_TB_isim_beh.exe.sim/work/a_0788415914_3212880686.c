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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/mRICH_hodo_DC_V1/HMB_QBLink_proto/HODO_DC_QBTOP.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0788415914_3212880686_p_0(char *t0)
{
    char t3[16];
    char *t1;
    unsigned char t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    xsi_set_current_line(143, ng0);
    t1 = (t0 + 3552U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 14312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(144, ng0);
    t4 = (t0 + 4232U);
    t5 = *((char **)t4);
    t4 = (t0 + 27228U);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t3, t5, t4, 1);
    t7 = (t0 + 14552);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 2U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(145, ng0);
    t1 = (t0 + 4232U);
    t4 = *((char **)t1);
    t12 = (1 - 1);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t4 + t15);
    t2 = *((unsigned char *)t1);
    t5 = (t0 + 14616);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t2;
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

}

static void work_a_0788415914_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(151, ng0);
    t1 = (t0 + 3392U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 14328);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(152, ng0);
    t3 = (t0 + 3912U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 14680);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

}

static void work_a_0788415914_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(196, ng0);
    t1 = (t0 + 7752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(200, ng0);
    t1 = (t0 + 7272U);
    t2 = *((char **)t1);
    t1 = (t0 + 14744);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(201, ng0);
    t1 = (t0 + 7112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 14808);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 14344);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(197, ng0);
    t1 = (t0 + 8072U);
    t5 = *((char **)t1);
    t1 = (t0 + 14744);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(198, ng0);
    t1 = (t0 + 7912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 14808);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}

static void work_a_0788415914_3212880686_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    int t12;
    char *t13;
    int t15;
    char *t16;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(237, ng0);
    t1 = (t0 + 3552U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 14360);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(238, ng0);
    t3 = (t0 + 9672U);
    t4 = *((char **)t3);
    t3 = (t0 + 28344);
    t6 = xsi_mem_cmp(t3, t4, 2U);
    if (t6 == 1)
        goto LAB6;

LAB11:    t7 = (t0 + 28346);
    t9 = xsi_mem_cmp(t7, t4, 2U);
    if (t9 == 1)
        goto LAB7;

LAB12:    t10 = (t0 + 28348);
    t12 = xsi_mem_cmp(t10, t4, 2U);
    if (t12 == 1)
        goto LAB8;

LAB13:    t13 = (t0 + 28350);
    t15 = xsi_mem_cmp(t13, t4, 2U);
    if (t15 == 1)
        goto LAB9;

LAB14:
LAB10:    xsi_set_current_line(260, ng0);
    t1 = (t0 + 28360);
    t4 = (t0 + 14936);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(240, ng0);
    t16 = (t0 + 6472U);
    t17 = *((char **)t16);
    t16 = (t0 + 27308U);
    t18 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t17, t16);
    t19 = (t18 == 2);
    if (t19 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(244, ng0);
    t1 = (t0 + 14872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB17:    goto LAB5;

LAB7:    xsi_set_current_line(248, ng0);
    t1 = (t0 + 14872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(249, ng0);
    t1 = (t0 + 28354);
    t4 = (t0 + 14936);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    goto LAB5;

LAB8:    xsi_set_current_line(253, ng0);
    t1 = (t0 + 14872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(254, ng0);
    t1 = (t0 + 28356);
    t4 = (t0 + 14936);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    goto LAB5;

LAB9:    xsi_set_current_line(257, ng0);
    t1 = (t0 + 28358);
    t4 = (t0 + 14936);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    goto LAB5;

LAB15:;
LAB16:    xsi_set_current_line(241, ng0);
    t20 = (t0 + 14872);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)3;
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(242, ng0);
    t1 = (t0 + 28352);
    t4 = (t0 + 14936);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    goto LAB17;

}

static void work_a_0788415914_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(287, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (15 - 4);
    t4 = (t3 * 1U);
    t5 = (16 - 19);
    t6 = (t5 * -1);
    t7 = (16U * t6);
    t8 = (0 + t7);
    t9 = (t8 + t4);
    t1 = (t2 + t9);
    t10 = (t0 + 15000);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 5U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t15 = (t0 + 14376);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0788415914_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(288, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (15 - 11);
    t4 = (t3 * 1U);
    t5 = (17 - 19);
    t6 = (t5 * -1);
    t7 = (16U * t6);
    t8 = (0 + t7);
    t9 = (t8 + t4);
    t1 = (t2 + t9);
    t10 = (t0 + 15064);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 12U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t15 = (t0 + 14392);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0788415914_3212880686_p_6(char *t0)
{
    char t20[16];
    char t22[16];
    char t27[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    char *t28;
    int t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(289, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (15 - 6);
    t4 = (t3 * 1U);
    t5 = (1 - 19);
    t6 = (t5 * -1);
    t7 = (16U * t6);
    t8 = (0 + t7);
    t9 = (t8 + t4);
    t1 = (t2 + t9);
    t10 = (t0 + 6312U);
    t11 = *((char **)t10);
    t12 = (15 - 11);
    t13 = (t12 * 1U);
    t14 = (2 - 19);
    t15 = (t14 * -1);
    t16 = (16U * t15);
    t17 = (0 + t16);
    t18 = (t17 + t13);
    t10 = (t11 + t18);
    t21 = ((IEEE_P_2592010699) + 4024);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 6;
    t24 = (t23 + 4U);
    *((int *)t24) = 0;
    t24 = (t23 + 8U);
    *((int *)t24) = -1;
    t25 = (0 - 6);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t26;
    t24 = (t27 + 0U);
    t28 = (t24 + 0U);
    *((int *)t28) = 11;
    t28 = (t24 + 4U);
    *((int *)t28) = 0;
    t28 = (t24 + 8U);
    *((int *)t28) = -1;
    t29 = (0 - 11);
    t26 = (t29 * -1);
    t26 = (t26 + 1);
    t28 = (t24 + 12U);
    *((unsigned int *)t28) = t26;
    t19 = xsi_base_array_concat(t19, t20, t21, (char)97, t1, t22, (char)97, t10, t27, (char)101);
    t26 = (7U + 12U);
    t30 = (19U != t26);
    if (t30 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 15128);
    t31 = (t28 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t19, 19U);
    xsi_driver_first_trans_fast(t28);

LAB2:    t35 = (t0 + 14408);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(19U, t26, 0);
    goto LAB6;

}

static void work_a_0788415914_3212880686_p_7(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(290, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (3 - 19);
    t4 = (t3 * -1);
    t5 = (16U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 15192);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 14424);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0788415914_3212880686_p_8(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(291, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (4 - 19);
    t4 = (t3 * -1);
    t5 = (16U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 15256);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 14440);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0788415914_3212880686_p_9(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(292, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = (11 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (5 - 19);
    t7 = (t6 * -1);
    t8 = (16U * t7);
    t9 = (0 + t8);
    t10 = (t9 + t5);
    t1 = (t2 + t10);
    t11 = *((unsigned char *)t1);
    t12 = (t0 + 15320);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = t11;
    xsi_driver_first_trans_fast(t12);

LAB2:    t17 = (t0 + 14456);
    *((int *)t17) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0788415914_3212880686_p_10(char *t0)
{
    char t28[16];
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    int t26;
    int t27;
    static char *nl0[] = {&&LAB18, &&LAB17, &&LAB19, &&LAB20, &&LAB21, &&LAB22, &&LAB22, &&LAB22, &&LAB22};

LAB0:    xsi_set_current_line(312, ng0);
    t2 = (t0 + 7752U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t2 = (t0 + 9832U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t1 = t8;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 5832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB10;

LAB11:    t2 = (t0 + 5992U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;

LAB12:    if (t1 != 0)
        goto LAB8;

LAB9:    xsi_set_current_line(317, ng0);
    t2 = (t0 + 3712U);
    t1 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t1 != 0)
        goto LAB13;

LAB15:
LAB14:
LAB3:    xsi_set_current_line(323, ng0);
    t2 = (t0 + 9032U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t1);
    goto **((char **)t2);

LAB2:    xsi_set_current_line(313, ng0);
    t2 = (t0 + 15384);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    xsi_set_current_line(315, ng0);
    t2 = (t0 + 15384);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB10:    t1 = (unsigned char)1;
    goto LAB12;

LAB13:    xsi_set_current_line(319, ng0);
    t3 = (t0 + 9192U);
    t6 = *((char **)t3);
    t4 = *((unsigned char *)t6);
    t3 = (t0 + 15384);
    t9 = (t3 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t4;
    xsi_driver_first_trans_fast(t3);
    goto LAB14;

LAB16:    t2 = (t0 + 14472);
    *((int *)t2) = 1;

LAB1:    return;
LAB17:    xsi_set_current_line(325, ng0);
    t6 = (t0 + 15448);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(326, ng0);
    t2 = (t0 + 5832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB26;

LAB27:    t1 = (unsigned char)0;

LAB28:    if (t1 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(329, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);

LAB24:    goto LAB16;

LAB18:    xsi_set_current_line(333, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t6 = (t0 + 15576);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 32U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(334, ng0);
    t2 = (t0 + 15448);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(335, ng0);
    t2 = (t0 + 15640);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(336, ng0);
    t2 = (t0 + 7752U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB29;

LAB31:    t2 = (t0 + 5512U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB32;

LAB33:
LAB30:    goto LAB16;

LAB19:    xsi_set_current_line(349, ng0);
    t2 = (t0 + 15640);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(350, ng0);
    t2 = (t0 + 5192U);
    t3 = *((char **)t2);
    t2 = (t0 + 6152U);
    t6 = *((char **)t2);
    t1 = 1;
    if (32U == 32U)
        goto LAB55;

LAB56:    t1 = 0;

LAB57:    if (t1 != 0)
        goto LAB52;

LAB54:    t2 = (t0 + 6152U);
    t3 = *((char **)t2);
    t2 = (t0 + 10408U);
    t6 = *((char **)t2);
    t4 = 1;
    if (32U == 32U)
        goto LAB66;

LAB67:    t4 = 0;

LAB68:    if (t4 == 1)
        goto LAB63;

LAB64:    t10 = (t0 + 6152U);
    t11 = *((char **)t10);
    t10 = (t0 + 10288U);
    t12 = *((char **)t10);
    t5 = 1;
    if (32U == 32U)
        goto LAB72;

LAB73:    t5 = 0;

LAB74:    t1 = t5;

LAB65:    if (t1 != 0)
        goto LAB61;

LAB62:
LAB53:    goto LAB16;

LAB20:    xsi_set_current_line(366, ng0);
    t2 = (t0 + 6632U);
    t3 = *((char **)t2);
    t2 = (t0 + 6472U);
    t6 = *((char **)t2);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t0 + 27324U);
    t11 = (t0 + 27308U);
    t2 = xsi_base_array_concat(t2, t28, t9, (char)97, t3, t10, (char)97, t6, t11, (char)101);
    t13 = (16U + 16U);
    t1 = (32U != t13);
    if (t1 == 1)
        goto LAB87;

LAB88:    t12 = (t0 + 15576);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 32U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(367, ng0);
    t2 = (t0 + 15448);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(368, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

LAB21:    xsi_set_current_line(371, ng0);
    t2 = (t0 + 6792U);
    t3 = *((char **)t2);
    t2 = (t0 + 6472U);
    t6 = *((char **)t2);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t0 + 27340U);
    t11 = (t0 + 27308U);
    t2 = xsi_base_array_concat(t2, t28, t9, (char)97, t3, t10, (char)97, t6, t11, (char)101);
    t13 = (16U + 16U);
    t1 = (32U != t13);
    if (t1 == 1)
        goto LAB89;

LAB90:    t12 = (t0 + 15576);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t2, 32U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(372, ng0);
    t2 = (t0 + 15448);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(373, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

LAB22:    xsi_set_current_line(375, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB16;

LAB23:    xsi_set_current_line(327, ng0);
    t2 = (t0 + 15512);
    t9 = (t2 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB24;

LAB26:    t2 = (t0 + 5992U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)3);
    t1 = t8;
    goto LAB28;

LAB29:    xsi_set_current_line(337, ng0);
    t2 = (t0 + 15512);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    goto LAB30;

LAB32:    xsi_set_current_line(339, ng0);
    t2 = (t0 + 15640);
    t6 = (t2 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(340, ng0);
    t2 = (t0 + 5192U);
    t3 = *((char **)t2);
    t2 = (t0 + 10408U);
    t6 = *((char **)t2);
    t4 = 1;
    if (32U == 32U)
        goto LAB40;

LAB41:    t4 = 0;

LAB42:    if (t4 == 1)
        goto LAB37;

LAB38:    t10 = (t0 + 5192U);
    t11 = *((char **)t10);
    t10 = (t0 + 10288U);
    t12 = *((char **)t10);
    t5 = 1;
    if (32U == 32U)
        goto LAB46;

LAB47:    t5 = 0;

LAB48:    t1 = t5;

LAB39:    if (t1 != 0)
        goto LAB34;

LAB36:    xsi_set_current_line(344, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);

LAB35:    goto LAB30;

LAB34:    xsi_set_current_line(341, ng0);
    t16 = (t0 + 5192U);
    t17 = *((char **)t16);
    t16 = (t0 + 15704);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t17, 32U);
    xsi_driver_first_trans_fast(t16);
    xsi_set_current_line(342, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB35;

LAB37:    t1 = (unsigned char)1;
    goto LAB39;

LAB40:    t13 = 0;

LAB43:    if (t13 < 32U)
        goto LAB44;
    else
        goto LAB42;

LAB44:    t2 = (t3 + t13);
    t9 = (t6 + t13);
    if (*((unsigned char *)t2) != *((unsigned char *)t9))
        goto LAB41;

LAB45:    t13 = (t13 + 1);
    goto LAB43;

LAB46:    t14 = 0;

LAB49:    if (t14 < 32U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t10 = (t11 + t14);
    t15 = (t12 + t14);
    if (*((unsigned char *)t10) != *((unsigned char *)t15))
        goto LAB47;

LAB51:    t14 = (t14 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(351, ng0);
    t10 = (t0 + 15512);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(352, ng0);
    t2 = (t0 + 15640);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB53;

LAB55:    t13 = 0;

LAB58:    if (t13 < 32U)
        goto LAB59;
    else
        goto LAB57;

LAB59:    t2 = (t3 + t13);
    t9 = (t6 + t13);
    if (*((unsigned char *)t2) != *((unsigned char *)t9))
        goto LAB56;

LAB60:    t13 = (t13 + 1);
    goto LAB58;

LAB61:    xsi_set_current_line(354, ng0);
    t16 = (t0 + 5192U);
    t17 = *((char **)t16);
    t22 = (31 - 15);
    t23 = (t22 * 1U);
    t24 = (0 + t23);
    t16 = (t17 + t24);
    t18 = (t0 + 15768);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t25 = *((char **)t21);
    memcpy(t25, t16, 16U);
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(355, ng0);
    t2 = (t0 + 5192U);
    t3 = *((char **)t2);
    t13 = (31 - 31);
    t14 = (t13 * 1U);
    t22 = (0 + t14);
    t2 = (t3 + t22);
    t6 = (t0 + 15832);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t2, 16U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(356, ng0);
    t2 = (t0 + 6152U);
    t3 = *((char **)t2);
    t2 = (t0 + 10408U);
    t6 = *((char **)t2);
    t1 = 1;
    if (32U == 32U)
        goto LAB81;

LAB82:    t1 = 0;

LAB83:    if (t1 != 0)
        goto LAB78;

LAB80:    xsi_set_current_line(360, ng0);
    t2 = (t0 + 6312U);
    t3 = *((char **)t2);
    t2 = (t0 + 6472U);
    t6 = *((char **)t2);
    t2 = (t0 + 27308U);
    t26 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t6, t2);
    t27 = (t26 - 19);
    t13 = (t27 * -1);
    xsi_vhdl_check_range_of_index(19, 0, -1, t26);
    t14 = (16U * t13);
    t22 = (0 + t14);
    t9 = (t3 + t22);
    t10 = (t0 + 15960);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t9, 16U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(361, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t2);

LAB79:    goto LAB53;

LAB63:    t1 = (unsigned char)1;
    goto LAB65;

LAB66:    t13 = 0;

LAB69:    if (t13 < 32U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t2 = (t3 + t13);
    t9 = (t6 + t13);
    if (*((unsigned char *)t2) != *((unsigned char *)t9))
        goto LAB67;

LAB71:    t13 = (t13 + 1);
    goto LAB69;

LAB72:    t14 = 0;

LAB75:    if (t14 < 32U)
        goto LAB76;
    else
        goto LAB74;

LAB76:    t10 = (t11 + t14);
    t15 = (t12 + t14);
    if (*((unsigned char *)t10) != *((unsigned char *)t15))
        goto LAB73;

LAB77:    t14 = (t14 + 1);
    goto LAB75;

LAB78:    xsi_set_current_line(357, ng0);
    t10 = (t0 + 6632U);
    t11 = *((char **)t10);
    t10 = (t0 + 6472U);
    t12 = *((char **)t10);
    t10 = (t0 + 27308U);
    t26 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t12, t10);
    t27 = (t26 - 19);
    t14 = (t27 * -1);
    t22 = (16U * t14);
    t23 = (0U + t22);
    t15 = (t0 + 15896);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t11, 16U);
    xsi_driver_first_trans_delta(t15, t23, 16U, 0LL);
    xsi_set_current_line(358, ng0);
    t2 = (t0 + 15512);
    t3 = (t2 + 56U);
    t6 = *((char **)t3);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB79;

LAB81:    t13 = 0;

LAB84:    if (t13 < 32U)
        goto LAB85;
    else
        goto LAB83;

LAB85:    t2 = (t3 + t13);
    t9 = (t6 + t13);
    if (*((unsigned char *)t2) != *((unsigned char *)t9))
        goto LAB82;

LAB86:    t13 = (t13 + 1);
    goto LAB84;

LAB87:    xsi_size_not_matching(32U, t13, 0);
    goto LAB88;

LAB89:    xsi_size_not_matching(32U, t13, 0);
    goto LAB90;

}


extern void work_a_0788415914_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0788415914_3212880686_p_0,(void *)work_a_0788415914_3212880686_p_1,(void *)work_a_0788415914_3212880686_p_2,(void *)work_a_0788415914_3212880686_p_3,(void *)work_a_0788415914_3212880686_p_4,(void *)work_a_0788415914_3212880686_p_5,(void *)work_a_0788415914_3212880686_p_6,(void *)work_a_0788415914_3212880686_p_7,(void *)work_a_0788415914_3212880686_p_8,(void *)work_a_0788415914_3212880686_p_9,(void *)work_a_0788415914_3212880686_p_10};
	xsi_register_didat("work_a_0788415914_3212880686", "isim/cmdInerpreter_TB_isim_beh.exe.sim/work/a_0788415914_3212880686.didat");
	xsi_register_executes(pe);
}
