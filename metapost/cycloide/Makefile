input=main

all:
	$(MAKE) ps

ps:
	mpost $(input).mp
	evince $(input).1 &
	#gv $(input).1 &

pdf:
	mptopdf $(input).mp
	xpdf $(input)-1.pdf &

.PHONY: clean

clean:
	$(RM) *.log *.mpx semantic.cache