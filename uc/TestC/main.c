#include <stdio.h>
#include <stdlib.h>

#include <math.h>

#include <stdint.h>
#include <stdbool.h>

#define CHR_PRECISION 4 // precision 1/10000eme = 1/(10^4)
#define CHR_DISPLAY 3 // display 1/1000  = 1/(10^3)

uint8_t running_chronometer = true; // 0 false ; -1 true

typedef struct {
    bool is_neg; // false=0(+) true=1(-)
    uint8_t hh; //8bits 0-255
    uint8_t mm; //8bits 0-255
    uint8_t ss; //8bits 0-255
    unsigned short int xx;  //16bits 0-65535
} time_typ;

time_typ current_time;
time_typ last_time;
time_typ best_time;


time_typ d_time; 


void init_time(time_typ * time) {
    time->is_neg = false;
    time->hh = 0;
    time->mm = 0;
    time->ss = 0;
    time->xx = 0;
}

void def_time(time_typ * time, uint8_t _hh, uint8_t _mm, uint8_t _ss, unsigned short int _xx) {
    time->is_neg = false;
    time->hh = _hh;
    time->mm = _mm;
    time->ss = _ss;
    time->xx = _xx;
}

void print_time(time_typ * t) {
    //printf("===%02i:%02i:%02i:%03u===\n",t->hh,t->mm,t->ss,t->xx/10);
    printf("%02i:%02i:%02i:%03u",t->hh,t->mm,t->ss,t->xx/((int) pow(10,CHR_PRECISION-CHR_DISPLAY)));
}

inline void inc_time(time_typ * time) {
  if (running_chronometer) {
    time->xx++;
    if(time->xx >= pow(10,CHR_PRECISION)) {
        time->xx = 0;
        time->ss++;
        if (time->ss >= 60) {
            time->ss = 0;
            time->mm++;
            if (time->mm >= 60) {
                time->mm = 0;
                time->hh++;
                if (time->hh >= 24) {
                    time->hh = 0;
					 }
            }
        }
    }
    //_delay_ms(1);
  }
}

void copy_time(time_typ * time_source, time_typ * time_dest) { // TO TEST (pointer ?)
    time_dest->hh = time_source->hh;
    time_dest->mm = time_source->mm;
    time_dest->ss = time_source->ss;
    time_dest->xx = time_source->xx;
}

bool time_is_null(time_typ * time) {
     if ( (time->hh == 0) &&  (time->mm == 0) && (time->ss == 0) && (time->xx == 0) ) {
         return true;     
     } else {
         return false;
     }     
}


uint8_t compare_time(time_typ * time1, time_typ * time2) {
    uint8_t result = 0;
    
    if ( time_is_null(time1) && time_is_null(time2) ) {
        return 0;
    }
    
    if ( time_is_null(time1) ) {
        return 2;      
    }
    
    if ( time_is_null(time2) ) {
        return 1;      
    }   
    
   
    if (time1->hh > time2->hh) {
        result = 2;
    }
    else if (time1->hh < time2->hh) {
        result = 1;
    }	
    else {      
        if (time1->mm > time2->mm) {
            result = 2;
        }
        else if (time1->mm < time2->mm) {
            result = 1;
        }	
        else {      
            if (time1->ss > time2->ss) {
                result = 2;
            }
            else if (time1->ss < time2->ss) {
                result = 1;
            }	
            else {      
                if (time1->xx > time2->xx) {
                    result = 2;
                }
                else if (time1->xx < time2->xx) {
                    result = 1;
                }	
                else {      
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


void diff_time(time_typ * time1, time_typ * time2, time_typ * d_time) {
    init_time(d_time);
    
    uint8_t cmp = compare_time(time1,time2);
    
    time_typ t_max,t_min;
    
    
    if ( cmp == 1 ) {
        time_typ * t_max = time2;
        time_typ * t_min = time1;
        d_time->is_neg = true;
    }
    if ( cmp == 2 ) {
        time_typ * t_max = time1;
        time_typ * t_min = time2;
        d_time->is_neg = false;           
    }
    
    // TO DO = -
    
    // TO FIX
    
    d_time->hh = t_max.hh - t_min.hh;
    d_time->mm = t_max.mm - t_min.mm;
    d_time->ss = t_max.ss - t_min.ss;
    d_time->xx = t_max.xx - t_min.xx;
    
    
    /*
    d_time->hh=0;
    d_time->mm=0;
    d_time->ss=10;
    d_time->xx=5000;
    */
    
    

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



// Tests



void test_inc(void) {
  printf("Hello\n");
  
  init_time(&current_time);
  
  while(1) {
    print_time(&current_time);
    system("PAUSE");       
    inc_time(&current_time);         
  }    
}

void test_copy(void) {
  init_time(&current_time);
  
  init_time(&last_time);

  def_time(&current_time, 1, 2,3,500);
  print_time(&current_time);
  
  def_time(&last_time, 2, 4,6,600);
  print_time(&last_time);
  
  copy_time(&current_time, &last_time);
  print_time(&last_time);
}

void test_compare(void) {
  def_time(&current_time, 2, 5,0,000);
  print_time(&current_time);
  
  def_time(&best_time, 0, 0,0,000);
  print_time(&best_time);
  
  printf("%i\n",compare_time(&current_time,&best_time));  
}

void test_is_null(void) {
  def_time(&current_time, 0, 0,0,000);
  if (time_is_null(&current_time)) {
    printf("null\n");
  } else {
    printf("not null\n");
  }   
}

void test_diff(void) {
  //def_time(&current_time, 0, 1,20,500);
  //def_time(&last_time, 0, 1,22,400);
  //print_diff_time(diff_time(&current_time,&last_time));
 
   
  //time_typ d_time;
  //def_time(&d_time, 0, 0, 59, 9999);
  //def_time(&d_time, 0, 0, 59, 9999);  
  //(&d_time)->is_neg = true;
  //print_diff_time(&d_time);
  
  def_time(&current_time, 0, 1,23,500);
  def_time(&last_time, 0, 1,22,400);
  
    
  diff_time(&current_time,&last_time,&d_time);
  
  print_time(&d_time);
  
  printf("\n");  
  
  print_diff_time(&d_time);    
  
  printf("\n");
    
}



int main(int argc, char *argv[])
{
  init_time(&current_time);
  init_time(&last_time);
  init_time(&best_time);
  //init_time(&diff_time);
  
  //test_compare();
  test_diff();
  
  system("PAUSE");	
  return 0; 
}
