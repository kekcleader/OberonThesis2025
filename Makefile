NAME=disser
NAME2=broshura

$(NAME2).pdf: $(NAME).pdf $(NAME2).tex
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME2).tex

$(NAME).pdf: $(NAME).tex lgu.cls bibliography.bib
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" bibtex $(NAME) || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true
	PATH="$(PWD)/.venv/bin:$(PWD)/tools/bin:$(PATH)" xelatex -shell-escape -interaction=nonstopmode $(NAME).tex || true

all: $(NAME2).pdf

run: all

.phony: clean cleanall run

clean:
	@rm -rf *.aux text/*.aux *.toc *.ent *.log text/*.log *.idx *.minted _minted *.gz *.out *.bbl *.blg >/dev/null 2>/dev/null .DS_Store

cleanall: clean
	@rm -f $(NAME2).pdf $(NAME).pdf >/dev/null 2>/dev/null

