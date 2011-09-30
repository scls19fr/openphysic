input=example

all:
	mpost $(input).mp
	evince $(input).1 &
	#gv $(input).1 &

.PHONY: clean

clean:
	$(RM) *.log *.mpx semantic.cache