IDE : MPLAB
C Compiler : HI-TECH C16
SIMULATOR : PROTEUS

Incrémentation chrono

void increment(void) {
	xx++;
	if (xx==1000) {
		xx=0;
		ss++;
		if (ss==60) {
			ss=0;
			mm++;
			if (mm==60) {
				mm=0;
				hh++;
				if (hh==24) {
					hh=0;
					//dd++;
				}
			}
		}
	}
}