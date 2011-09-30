DATA=main.dat
WAVE=main.wav

all:
	./create_sample.pl 5 $(DATA)
	sox main.dat $(WAVE)
	totem $(WAVE)