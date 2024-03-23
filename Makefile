### Makefile build system for LaTeX 
TARGET 		:= *.pdf
TEX_FLAGS 	:= -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make
CC 			:= latexmk
SRC			:= main.tex


.PHONY: MyDoc.pdf all clean cleanall

all: $(TARGET)

# Build the PDF 
%.tex: %.raw
	@./raw2tex $< > $@

%.tex: %.dat
	@./dat2tex $< > $@

$(TARGET): $(SRC)
	@$(CC) $(TEX_FLAGS)  $^

# Opens the PDF
run: $(TARGET)
	@$(shell zathura $^)

# Removes the clutter (not the PDF)
clean:
	@$(CC) -c

# Removes everything
cleanall:
	@$(CC) -CA

build: cleanall all
