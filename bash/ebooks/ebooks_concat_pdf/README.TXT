This script is useful to concatenate many pdf files
  many PDF files can be download using DownThemAll!
  https://addons.mozilla.org/fr/firefox/addon/downthemall/

Copy pdf files in in/ directory
Modify _config.sh
Run ./make_file_list.sh to make files.txt (list of unordered files)
A copy of files.txt is also done (and named files_ordered.txt)
Change files order in files_ordered.txt
Run ./concat.sh to generate output pdf file (in out/ directory)