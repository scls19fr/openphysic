Remplacer \section par \Section
===============================
- zsh
perl -pi -e 's/\\section/\\Section/g' ./**/*.tex(.)

ou sed -i ...

- bash
find . -name '*.tex' -type f -exec perl -pi -e '
  s/\\section/\\Section/g' {} +

Remplacer $$...$$ par \[ \]
===========================
perl -pi -e '
  s/\$\$(.*?)\$\$/\\[$1\\]/g;' ./**/*.tex


find . -name '*.tex' -type f -exec perl -0777 -pi -e '
   s/\\section\b/\\Section/g;
   s{
     \$\$ ((?: \\. | . | %.*?\n)*?) \$\$ |
     %.*?\n |
     \\verb(.).*?\2 |
     \\begin\{verbatim\}.*?\\end\{verbatim\} |
     \\. |
     .[^\\%\$]*
   }{defined($1) ? "\\[$1\\]" : "$&"}gsxe;' {} +