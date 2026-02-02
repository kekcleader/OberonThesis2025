NAME=disser

broshura.pdf: $(NAME).pdf broshura.tex
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode broshura.tex

$(NAME).pdf: $(NAME).tex lgu.cls bibliography.bib
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" bibtex $(NAME) || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true

all: broshura.pdf

run: all

.phony: clean cleanall run

clean:
	@rm -rf *.aux text/*.aux *.toc *.ent *.log text/*.log *.idx *.minted _minted *.gz *.out *.bbl *.blg >/dev/null 2>/dev/null .DS_Store

cleanall: clean
	@rm -f broshura.pdf $(NAME).pdf >/dev/null 2>/dev/null

