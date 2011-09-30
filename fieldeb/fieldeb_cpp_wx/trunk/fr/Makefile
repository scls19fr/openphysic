FILENAME=fielde

.PHONY: po mo

po:
	xgettext -C -n -k_ -o $(FILENAME).po ../*.cpp

mo:
	msgfmt -o fielde.mo fielde.po