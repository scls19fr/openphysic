/***************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
 *   s.cls@laposte.net                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

typedef struct
{
    bool is_neg; // false=0(+) true=1(-)
    uint8_t hh; //8bits 0-255
    uint8_t mm; //8bits 0-255
    uint8_t ss; //8bits 0-255
    unsigned short int xx;  //16bits 0-65535
}
time_typ;

time_typ current_time;
time_typ last_time;
time_typ before_last_time;
time_typ best_time;

void init_time(time_typ * time)
{
    time->is_neg = false;
    time->hh = 0;
    time->mm = 0;
    time->ss = 0;
    time->xx = 0;
}

void def_time(time_typ * time, uint8_t _hh, uint8_t _mm, uint8_t _ss, unsigned short int _xx)
{
    time->is_neg = false;
    time->hh = _hh;
    time->mm = _mm;
    time->ss = _ss;
    time->xx = _xx;
}

void print_time_hh_mm(time_typ * t)
{
   if (t->hh < 100) {
      printf("%02i:%02i",t->hh,t->mm);
   } else {
      printf("++:++");
   }
}

void print_time_hh_mm_ss_xxx(time_typ * t)
{
   if (t->hh < 100) {
      printf("%02i:%02i",t->hh,t->mm);
   } else {
      printf("%02i:%02i:%02i:%03u",t->hh,t->mm,t->ss,t->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
   }
}

void print_time_mm_ss_xxx(time_typ * t)
{
    //printf("===%02i:%02i:%02i:%03u===\n",t->hh,t->mm,t->ss,t->xx/10);
    //lcd_printf("%02i:%02i:%02i:%03u",t->hh,t->mm,t->ss,t->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
    if (t->hh < 1) {
       printf("%02i:%02i:%03u",t->mm,t->ss,t->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
    } else {
       printf("++:++:+++");
    }
}

void print_time_m_ss_xxx(time_typ * t)
{
   if (t->mm < 10) {
      printf("%01i:%02i:%03u",t->mm,t->ss,t->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
   } else {
      printf("+:++:+++");
   }
}


inline void inc_time(time_typ * time)
{
        time->xx++;
        if(time->xx >= pow(10,CHR_PRECISION))
        {
            time->xx = 0;
            time->ss++;
            if (time->ss >= 60)
            {
                time->ss = 0;
                time->mm++;
                if (time->mm >= 60)
                {
                    time->mm = 0;
                    time->hh++;
                    if (time->hh >= 24)
                    {
                        time->hh = 0;
                    }
                }
            }
        }
        //_delay_ms(1); // use timer interrupts instead of delay
}

void copy_time(time_typ * time_source, time_typ * time_dest)
{
    time_dest->hh = time_source->hh;
    time_dest->mm = time_source->mm;
    time_dest->ss = time_source->ss;
    time_dest->xx = time_source->xx;
}

bool time_is_null(time_typ * time)
{
    if ( (time->hh == 0) &&  (time->mm == 0) && (time->ss == 0) && (time->xx == 0) )
    {
        return true;
    }
    else
    {
        return false;
    }
}

uint8_t compare_time(time_typ * time1, time_typ * time2)
{
    uint8_t result = 0;

    if ( time_is_null(time1) && time_is_null(time2) )
    {
        return 0;
    }

    if ( time_is_null(time1) )
    {
        return 2;
    }

    if ( time_is_null(time2) )
    {
        return 1;
    }


    if (time1->hh > time2->hh)
    {
        result = 2;
    }
    else if (time1->hh < time2->hh)
    {
        result = 1;
    }
    else
    {
        if (time1->mm > time2->mm)
        {
            result = 2;
        }
        else if (time1->mm < time2->mm)
        {
            result = 1;
        }
        else
        {
            if (time1->ss > time2->ss)
            {
                result = 2;
            }
            else if (time1->ss < time2->ss)
            {
                result = 1;
            }
            else
            {
                if (time1->xx > time2->xx)
                {
                    result = 2;
                }
                else if (time1->xx < time2->xx)
                {
                    result = 1;
                }
                else
                {
                    result = 0;
                }
            }
        }
    }

    // return the best time (lower) (if different from 00:00:00:000)
    // 0 time1=time2
    // 1 time1>time2
    // 2 time1<time2
    return result;

}

void print_diff_time(time_typ * time) {
    time_typ max_time;
    def_time(&max_time, 0, 1, 00, 0000);

    if ( time_is_null(time) ) {
        printf("=00:000");
    } else {
            if ( time->is_neg ) {
                printf("-");
            } else {
                printf("+");
            }
            if ( compare_time(time,&max_time) == 1 ) {
                printf("%02i:%03u",time->ss,time->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
            } else {
                printf("xx:xxx");
            }
    }
}








