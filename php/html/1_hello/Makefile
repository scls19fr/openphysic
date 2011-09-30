input=index

all:
	$(MAKE) $(input).html

$(input).html: $(input).php
	php $(input).php > $(input).html
	firefox $(input).html

clean:
	$(RM) $(input).html
