all:
	g++ *.cc -o main

run:
	$(MAKE) clean
	./main

clean:
	$(RM) *.xml *.xml~

validate:
	xmllint *.xml