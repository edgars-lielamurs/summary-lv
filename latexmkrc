# USAGE:
#   'latexmk'      - compiles the project
#   'latexmk -c'   - cleans the project 
#   'latexmk -C'   - cleans the project (including pdf output)
#   'latexmk -pvc' - continiously updates output file

# enable shell escape (for pdf generation from svg files)
$latex = 'latex %O -shell-escape %S';
$pdflatex = 'xelatex %O -shell-escape %S';

# instruct latexmk to generate a pdf file
$pdf_mode = 1;

# set up directory for auxilary and output files
$out_dir = 'out';

ensure_path('TEXINPUTS', 'src//', 'fig//', 'pkg//');

# provide the root file (other files should be found automatically)
@default_files = ('src/main-lv.tex');

# for glossary handling
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
}
