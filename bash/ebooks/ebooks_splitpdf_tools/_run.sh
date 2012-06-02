#!/usr/bin/env bash

source _config.sh

ls -lh in/

./pdf2pbm.sh
#./pdf_txt2pbm.sh
./split_pbm_minw.sh
#./bw2wb.sh
#./fix_cover_jpg.sh
#./remove_last_page.sh # todo (when last page is blank)
./pbm2pdf.sh

ls -lh out/