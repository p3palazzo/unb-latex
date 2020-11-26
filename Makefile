# {{{1 Configurações gerais
#      ====================

VPATH = .:assets
vpath %.csl styles
vpath %.html .:_includes:_layouts:_site
vpath %.scss assets/css
vpath %.xml _site
vpath %.yaml .:_spec

PANDOC/LATEX := docker run -u "`id -u`:`id -g`" \
		-v "`pwd`:/data" -v "`pwd`/assets/fonts:/usr/share/fonts" \
		pandoc/latex:2.11.2

# {{{1 Produtos PDF
#      ============

artigo.pdf : pdf.yaml artigo.md | styles
	$(PANDOC/LATEX) -o $@ -d $^

%.pdf : pdf.yaml %.md | styles
	$(PANDOC/LATEX) -o $@ -d $^

%.tex : pdf.yaml %.md | styles
	$(PANDOC/LATEX) -o $@ -d $^

# {{{1 PHONY
#      =====

styles :
	git clone https://github.com/citation-style-language/styles.git

clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml

# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
