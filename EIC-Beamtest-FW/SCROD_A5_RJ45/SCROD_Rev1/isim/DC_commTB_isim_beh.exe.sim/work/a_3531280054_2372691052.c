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
static const char *ng0 = "C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/DC_commTB.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3531280054_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 7248U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 7976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 5424U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 7056);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 7976);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 5424U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 7056);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3531280054_2372691052_p_1(char *t0)
{
    char t18[16];
    char t19[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    int64 t10;
    unsigned char t11;
    unsigned int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 7496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(132, ng0);
    t2 = xsi_get_transient_memory(4U);
    memset(t2, 0, 4U);
    t3 = t2;
    memset(t3, (unsigned char)3, 4U);
    t4 = (t0 + 8040);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(133, ng0);
    t9 = (100 * 1000LL);
    t2 = (t0 + 7304);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 5424U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t10 = (t9 * 10);
    t2 = (t0 + 7304);
    xsi_process_wait(t2, t10);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(136, ng0);
    t2 = xsi_get_transient_memory(4U);
    memset(t2, 0, 4U);
    t3 = t2;
    memset(t3, (unsigned char)2, 4U);
    t4 = (t0 + 8040);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(137, ng0);

LAB14:    t2 = (t0 + 7816);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t8 = (t0 + 7816);
    *((int *)t8) = 0;
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 15276);
    t4 = (t0 + 8104);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 15308);
    t4 = (t0 + 8168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(140, ng0);
    t2 = xsi_get_transient_memory(4U);
    memset(t2, 0, 4U);
    t3 = t2;
    memset(t3, (unsigned char)2, 4U);
    t4 = (t0 + 8232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 15312);
    t4 = (t0 + 8296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(142, ng0);

LAB24:    t2 = (t0 + 7832);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB13:    t3 = (t0 + 3848U);
    t4 = *((char **)t3);
    t3 = (t0 + 15272);
    t11 = 1;
    if (4U == 4U)
        goto LAB16;

LAB17:    t11 = 0;

LAB18:    if (t11 == 1)
        goto LAB12;
    else
        goto LAB14;

LAB15:    goto LAB13;

LAB16:    t12 = 0;

LAB19:    if (t12 < 4U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t6 = (t4 + t12);
    t7 = (t3 + t12);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB17;

LAB21:    t12 = (t12 + 1);
    goto LAB19;

LAB22:    t17 = (t0 + 7832);
    *((int *)t17) = 0;
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 4328U);
    t3 = *((char **)t2);
    t13 = (0 - 3);
    t12 = (t13 * -1);
    t14 = (32U * t12);
    t15 = (0 + t14);
    t2 = (t3 + t15);
    t4 = (t0 + 8360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 15348);
    t4 = (t0 + 8424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 15352);
    t4 = (t0 + 8232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(146, ng0);

LAB34:    t2 = (t0 + 7848);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB23:    t3 = (t0 + 4328U);
    t4 = *((char **)t3);
    t13 = (0 - 3);
    t12 = (t13 * -1);
    t14 = (32U * t12);
    t15 = (0 + t14);
    t3 = (t4 + t15);
    t5 = (t0 + 15316);
    t11 = 1;
    if (32U == 32U)
        goto LAB26;

LAB27:    t11 = 0;

LAB28:    if (t11 == 1)
        goto LAB22;
    else
        goto LAB24;

LAB25:    goto LAB23;

LAB26:    t16 = 0;

LAB29:    if (t16 < 32U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t7 = (t3 + t16);
    t8 = (t5 + t16);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB27;

LAB31:    t16 = (t16 + 1);
    goto LAB29;

LAB32:    t8 = (t0 + 7848);
    *((int *)t8) = 0;
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 15388);
    t4 = (t0 + 8104);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 15420);
    t4 = (t0 + 8168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 15424);
    t4 = (t0 + 8296);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(150, ng0);

LAB44:    t2 = (t0 + 7864);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB33:    t3 = (t0 + 3368U);
    t4 = *((char **)t3);
    t3 = (t0 + 15356);
    t11 = 1;
    if (32U == 32U)
        goto LAB36;

LAB37:    t11 = 0;

LAB38:    if (t11 == 1)
        goto LAB32;
    else
        goto LAB34;

LAB35:    goto LAB33;

LAB36:    t12 = 0;

LAB39:    if (t12 < 32U)
        goto LAB40;
    else
        goto LAB38;

LAB40:    t6 = (t4 + t12);
    t7 = (t3 + t12);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB37;

LAB41:    t12 = (t12 + 1);
    goto LAB39;

LAB42:    t8 = (t0 + 7864);
    *((int *)t8) = 0;
    xsi_set_current_line(151, ng0);

LAB54:    t2 = (t0 + 7880);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB43:    t3 = (t0 + 4488U);
    t4 = *((char **)t3);
    t3 = (t0 + 15428);
    t11 = 1;
    if (4U == 4U)
        goto LAB46;

LAB47:    t11 = 0;

LAB48:    if (t11 == 1)
        goto LAB42;
    else
        goto LAB44;

LAB45:    goto LAB43;

LAB46:    t12 = 0;

LAB49:    if (t12 < 4U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t6 = (t4 + t12);
    t7 = (t3 + t12);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB47;

LAB51:    t12 = (t12 + 1);
    goto LAB49;

LAB52:    t17 = (t0 + 7880);
    *((int *)t17) = 0;
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 4328U);
    t3 = *((char **)t2);
    t13 = (3 - 3);
    t12 = (t13 * -1);
    t14 = (32U * t12);
    t15 = (0 + t14);
    t2 = (t3 + t15);
    t4 = (t0 + 8360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(153, ng0);
    t2 = (t0 + 15464);
    t4 = (t0 + 8424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 15468);
    t4 = (t0 + 8232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(155, ng0);

LAB64:    t2 = (t0 + 7896);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB53:    t3 = (t0 + 4328U);
    t4 = *((char **)t3);
    t13 = (3 - 3);
    t12 = (t13 * -1);
    t14 = (32U * t12);
    t15 = (0 + t14);
    t3 = (t4 + t15);
    t5 = (t0 + 15432);
    t11 = 1;
    if (32U == 32U)
        goto LAB56;

LAB57:    t11 = 0;

LAB58:    if (t11 == 1)
        goto LAB52;
    else
        goto LAB54;

LAB55:    goto LAB53;

LAB56:    t16 = 0;

LAB59:    if (t16 < 32U)
        goto LAB60;
    else
        goto LAB58;

LAB60:    t7 = (t3 + t16);
    t8 = (t5 + t16);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB57;

LAB61:    t16 = (t16 + 1);
    goto LAB59;

LAB62:    t8 = (t0 + 7896);
    *((int *)t8) = 0;
    xsi_set_current_line(156, ng0);
    t2 = (t0 + 5544U);
    t3 = *((char **)t2);
    t2 = (t0 + 5784U);
    t4 = *((char **)t2);
    t5 = ((IEEE_P_2592010699) + 4024);
    t6 = (t0 + 14880U);
    t7 = (t0 + 14912U);
    t2 = xsi_base_array_concat(t2, t18, t5, (char)97, t3, t6, (char)97, t4, t7, (char)101);
    t8 = (t0 + 5664U);
    t17 = *((char **)t8);
    t20 = ((IEEE_P_2592010699) + 4024);
    t21 = (t0 + 14896U);
    t8 = xsi_base_array_concat(t8, t19, t20, (char)97, t2, t18, (char)97, t17, t21, (char)101);
    t12 = (24U + 3U);
    t14 = (t12 + 5U);
    t11 = (32U != t14);
    if (t11 == 1)
        goto LAB72;

LAB73:    t22 = (t0 + 8360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t8, 32U);
    xsi_driver_first_trans_fast(t22);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 15504);
    t4 = (t0 + 8424);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 15508);
    t4 = (t0 + 8232);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(159, ng0);

LAB76:    *((char **)t1) = &&LAB77;
    goto LAB1;

LAB63:    t3 = (t0 + 3368U);
    t4 = *((char **)t3);
    t3 = (t0 + 15472);
    t11 = 1;
    if (32U == 32U)
        goto LAB66;

LAB67:    t11 = 0;

LAB68:    if (t11 == 1)
        goto LAB62;
    else
        goto LAB64;

LAB65:    goto LAB63;

LAB66:    t12 = 0;

LAB69:    if (t12 < 32U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t6 = (t4 + t12);
    t7 = (t3 + t12);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB67;

LAB71:    t12 = (t12 + 1);
    goto LAB69;

LAB72:    xsi_size_not_matching(32U, t14, 0);
    goto LAB73;

LAB74:    goto LAB2;

LAB75:    goto LAB74;

LAB77:    goto LAB75;

}


extern void work_a_3531280054_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3531280054_2372691052_p_0,(void *)work_a_3531280054_2372691052_p_1};
	xsi_register_didat("work_a_3531280054_2372691052", "isim/DC_commTB_isim_beh.exe.sim/work/a_3531280054_2372691052.didat");
	xsi_register_executes(pe);
}
