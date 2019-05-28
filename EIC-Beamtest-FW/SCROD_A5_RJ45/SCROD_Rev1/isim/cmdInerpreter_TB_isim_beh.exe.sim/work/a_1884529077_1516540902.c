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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/QBLink/source/ByteLink.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_1884529077_1516540902_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7488);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t3 = (t0 + 7600);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 10U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 7664);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 7728);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

}

static void work_a_1884529077_1516540902_p_1(char *t0)
{
    char t30[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    unsigned char t25;
    unsigned char t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t31;
    unsigned int t32;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5};

LAB0:    xsi_set_current_line(151, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 72U);
    xsi_set_current_line(154, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 30U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 10U);
    xsi_set_current_line(157, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 20U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(160, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t3 = (char *)((nl0) + t5);
    goto **((char **)t3);

LAB2:    xsi_set_current_line(203, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t11 = (t5 == (unsigned char)3);
    if (t11 != 0)
        goto LAB43;

LAB45:
LAB44:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t1 = (t0 + 7792);
    t3 = (t1 + 56U);
    t6 = *((char **)t3);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 72U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 12U);
    t1 = (t2 + t4);
    t3 = (t0 + 7856);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(212, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 20U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t3 = (t0 + 7920);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(213, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t2 + t4);
    t5 = *((unsigned char *)t1);
    t3 = (t0 + 7984);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(214, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 30U);
    t1 = (t2 + t4);
    t3 = (t0 + 8048);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 10U);
    xsi_driver_first_trans_fast_port(t3);
    t1 = (t0 + 7504);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(162, ng0);
    t6 = xsi_get_transient_memory(32U);
    memset(t6, 0, 32U);
    t7 = t6;
    memset(t7, (unsigned char)2, 32U);
    t8 = (t0 + 5688U);
    t9 = *((char **)t8);
    t10 = (0 + 40U);
    t8 = (t9 + t10);
    memcpy(t8, t6, 32U);
    xsi_set_current_line(163, ng0);
    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 21U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 8U);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 5448U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 29U);
    t1 = (t3 + t4);
    *((unsigned char *)t1) = t5;
    xsi_set_current_line(165, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(166, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB2;

LAB4:    xsi_set_current_line(168, ng0);
    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 21U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 8U);
    xsi_set_current_line(169, ng0);
    t1 = (t0 + 5448U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 29U);
    t1 = (t3 + t4);
    *((unsigned char *)t1) = t5;
    xsi_set_current_line(170, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t13 = *((unsigned char *)t2);
    t14 = (t13 == (unsigned char)2);
    if (t14 == 1)
        goto LAB16;

LAB17:    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 13304U);
    t6 = (t0 + 5208U);
    t7 = *((char **)t6);
    t6 = (t0 + 13368U);
    t16 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t3, t1, t7, t6);
    if (t16 == 1)
        goto LAB19;

LAB20:    t15 = (unsigned char)0;

LAB21:    t12 = t15;

LAB18:    if (t12 == 1)
        goto LAB13;

LAB14:    t20 = (t0 + 2952U);
    t21 = *((char **)t20);
    t22 = *((unsigned char *)t21);
    t23 = (t22 == (unsigned char)3);
    t11 = t23;

LAB15:    if (t11 == 1)
        goto LAB10;

LAB11:    t20 = (t0 + 3112U);
    t24 = *((char **)t20);
    t25 = *((unsigned char *)t24);
    t26 = (t25 == (unsigned char)3);
    t5 = t26;

LAB12:    if (t5 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(174, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 40U);
    t1 = (t2 + t4);
    t3 = (t0 + 9152);
    t6 = xsi_record_get_element_type(t3, 8);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t9 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t30, t1, t8, 1);
    t17 = (t0 + 5688U);
    t18 = *((char **)t17);
    t10 = (0 + 40U);
    t17 = (t18 + t10);
    t20 = (t30 + 12U);
    t31 = *((unsigned int *)t20);
    t32 = (1U * t31);
    memcpy(t17, t9, t32);

LAB8:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t4 = (0 + 40U);
    t1 = (t2 + t4);
    t3 = (t0 + 9152);
    t6 = xsi_record_get_element_type(t3, 8);
    t7 = (t6 + 80U);
    t8 = *((char **)t7);
    t5 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t1, t8, 100);
    if (t5 != 0)
        goto LAB22;

LAB24:
LAB23:    goto LAB2;

LAB5:    xsi_set_current_line(181, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 1U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(183, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t13 = *((unsigned char *)t2);
    t14 = (t13 == (unsigned char)3);
    if (t14 == 1)
        goto LAB34;

LAB35:    t12 = (unsigned char)0;

LAB36:    if (t12 == 1)
        goto LAB31;

LAB32:    t20 = (t0 + 2952U);
    t21 = *((char **)t20);
    t22 = *((unsigned char *)t21);
    t23 = (t22 == (unsigned char)3);
    t11 = t23;

LAB33:    if (t11 == 1)
        goto LAB28;

LAB29:    t20 = (t0 + 3112U);
    t24 = *((char **)t20);
    t25 = *((unsigned char *)t24);
    t26 = (t25 == (unsigned char)3);
    t5 = t26;

LAB30:    if (t5 != 0)
        goto LAB25;

LAB27:
LAB26:    xsi_set_current_line(188, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t11 = (t5 == (unsigned char)2);
    if (t11 != 0)
        goto LAB40;

LAB42:    xsi_set_current_line(192, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 21U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 8U);
    xsi_set_current_line(193, ng0);
    t1 = (t0 + 5568U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 29U);
    t1 = (t3 + t4);
    *((unsigned char *)t1) = t5;

LAB41:    xsi_set_current_line(196, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t5);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 20U);
    t1 = (t3 + t4);
    *((unsigned char *)t1) = t11;
    xsi_set_current_line(197, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 12U);
    t1 = (t3 + t4);
    memcpy(t1, t2, 8U);
    goto LAB2;

LAB6:    xsi_set_current_line(199, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB2;

LAB7:    xsi_set_current_line(172, ng0);
    t20 = xsi_get_transient_memory(32U);
    memset(t20, 0, 32U);
    t27 = t20;
    memset(t27, (unsigned char)2, 32U);
    t28 = (t0 + 5688U);
    t29 = *((char **)t28);
    t4 = (0 + 40U);
    t28 = (t29 + t4);
    memcpy(t28, t20, 32U);
    goto LAB8;

LAB10:    t5 = (unsigned char)1;
    goto LAB12;

LAB13:    t11 = (unsigned char)1;
    goto LAB15;

LAB16:    t12 = (unsigned char)1;
    goto LAB18;

LAB19:    t8 = (t0 + 2472U);
    t9 = *((char **)t8);
    t8 = (t0 + 13304U);
    t17 = (t0 + 5328U);
    t18 = *((char **)t17);
    t17 = (t0 + 13384U);
    t19 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t9, t8, t18, t17);
    t15 = t19;
    goto LAB21;

LAB22:    xsi_set_current_line(177, ng0);
    t9 = xsi_get_transient_memory(32U);
    memset(t9, 0, 32U);
    t17 = t9;
    memset(t17, (unsigned char)2, 32U);
    t18 = (t0 + 5688U);
    t20 = *((char **)t18);
    t10 = (0 + 40U);
    t18 = (t20 + t10);
    memcpy(t18, t9, 32U);
    xsi_set_current_line(178, ng0);
    t1 = (t0 + 5688U);
    t2 = *((char **)t1);
    t4 = (0 + 0U);
    t1 = (t2 + t4);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB23;

LAB25:    xsi_set_current_line(185, ng0);
    t20 = (t0 + 5688U);
    t27 = *((char **)t20);
    t4 = (0 + 0U);
    t20 = (t27 + t4);
    *((unsigned char *)t20) = (unsigned char)0;
    goto LAB26;

LAB28:    t5 = (unsigned char)1;
    goto LAB30;

LAB31:    t11 = (unsigned char)1;
    goto LAB33;

LAB34:    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 13304U);
    t6 = (t0 + 5208U);
    t7 = *((char **)t6);
    t6 = (t0 + 13368U);
    t16 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t3, t1, t7, t6);
    if (t16 == 1)
        goto LAB37;

LAB38:    t15 = (unsigned char)0;

LAB39:    t12 = t15;
    goto LAB36;

LAB37:    t8 = (t0 + 2472U);
    t9 = *((char **)t8);
    t8 = (t0 + 13304U);
    t17 = (t0 + 5328U);
    t18 = *((char **)t17);
    t17 = (t0 + 13384U);
    t19 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t9, t8, t18, t17);
    t15 = t19;
    goto LAB39;

LAB40:    xsi_set_current_line(189, ng0);
    t1 = (t0 + 5328U);
    t3 = *((char **)t1);
    t1 = (t0 + 5688U);
    t6 = *((char **)t1);
    t4 = (0 + 21U);
    t1 = (t6 + t4);
    memcpy(t1, t3, 8U);
    xsi_set_current_line(190, ng0);
    t1 = (t0 + 5448U);
    t2 = *((char **)t1);
    t5 = *((unsigned char *)t2);
    t1 = (t0 + 5688U);
    t3 = *((char **)t1);
    t4 = (0 + 29U);
    t1 = (t3 + t4);
    *((unsigned char *)t1) = t5;
    goto LAB41;

LAB43:    xsi_set_current_line(204, ng0);
    t1 = (t0 + 5088U);
    t3 = *((char **)t1);
    t1 = (t0 + 5688U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t3, 72U);
    goto LAB44;

}

static void work_a_1884529077_1516540902_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(221, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7520);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(222, ng0);
    t3 = (t0 + 4232U);
    t4 = *((char **)t3);
    t3 = (t0 + 8112);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 72U);
    xsi_driver_first_trans_delta(t3, 0U, 72U, 1000LL);
    t9 = (t0 + 8112);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB3;

}


extern void work_a_1884529077_1516540902_init()
{
	static char *pe[] = {(void *)work_a_1884529077_1516540902_p_0,(void *)work_a_1884529077_1516540902_p_1,(void *)work_a_1884529077_1516540902_p_2};
	xsi_register_didat("work_a_1884529077_1516540902", "isim/cmdInerpreter_TB_isim_beh.exe.sim/work/a_1884529077_1516540902.didat");
	xsi_register_executes(pe);
}
