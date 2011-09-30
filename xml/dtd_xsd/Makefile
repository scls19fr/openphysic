file=formation

all:
	$(MAKE) valid-dtd
	$(MAKE) valid-xsd
	$(MAKE) valid-rng
	$(MAKE) valid-compactrng

indent:
	xmllint ${file}.xml --format

# DTD
valid-dtd:
	#xmllint ${file}.xml --noout --loaddtd --valid
	xmllint ${file}.xml --noout --dtdvalid ${file}.dtd

# XML Schema
valid-xsd:
	xmllint ${file}.xml --noout --schema ${file}.xsd
	
# RelaxNG
valid-rng:
	xmllint ${file}.xml --noout --relaxng ${file}.rng
	
# RelaxNG compact
valid-compactrng:
	trang ${file}.rnc ${file}_compact.rng
	xmllint ${file}.xml --noout --relaxng ${file}_compact.rng
