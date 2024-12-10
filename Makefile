LATEXMK = latexmk -verbose -file-line-error -synctex=1 -interaction=nonstopmode -pdf -view=none
LATEXMK_INTERACTIVE = latexmk -verbose -file-line-error -synctex=1 -interaction=nonstopmode -pdf -view=none -pvc
LATEX_SEQ = pdflatex -interaction=nonstopmode -synctex=1
BIBER = biber
MAKEGLOSSARIES = makeglossaries

TARGET = main
SRC_DIR = .
OUT_DIR = .

.PHONY: all clean interactive alt-build

all:
	$(LATEXMK) $(TARGET).tex

interactive:
	$(LATEXMK_INTERACTIVE) $(TARGET).tex

alt-build:
	$(LATEX_SEQ) $(TARGET).tex
	$(BIBER) $(TARGET)
	$(MAKEGLOSSARIES) $(TARGET)
	$(LATEX_SEQ) $(TARGET).tex
	$(LATEX_SEQ) $(TARGET).tex	
	$(BIBER) $(TARGET)

clean:
	rm -f $(OUT_DIR)/*.aux $(OUT_DIR)/*.bbl $(OUT_DIR)/*.bcf $(OUT_DIR)/*.blg $(OUT_DIR)/*.glo \
	      $(OUT_DIR)/*.glg $(OUT_DIR)/*.gls $(OUT_DIR)/*.ist $(OUT_DIR)/*.lof $(OUT_DIR)/*.log \
	      $(OUT_DIR)/*.lot $(OUT_DIR)/*.out $(OUT_DIR)/*.run.xml $(OUT_DIR)/*.toc $(OUT_DIR)/*.acn \
	      $(OUT_DIR)/*.acr $(OUT_DIR)/*.alg $(OUT_DIR)/*.fdb_latexmk $(OUT_DIR)/*.fls $(OUT_DIR)/*.synctex.gz
	rm -f $(SRC_DIR)/content/*.aux

