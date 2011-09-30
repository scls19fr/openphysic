input=main

all:
	g++ -o $(input) $(input).cc -lcgicc
	sudo cp $(input) /usr/lib/cgi-bin
	firefox http://127.0.0.1/cgi-bin/$(input)?name=a_cgi_beginner
