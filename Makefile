# {{{1 Configurações gerais
#      ====================

VPATH = .:assets
vpath %.csl styles
vpath %.html .:_includes:_layouts:_site
vpath %.scss assets/css
vpath %.xml _site
vpath %.yaml .:spec
vpath default.% lib

# {{{1 Produtos PDF
#      ============

%.pdf : pdf.yaml %.md | styles
	docker run -v "`pwd`:/data" --user "`id -u`:`id -g`" \
		-v "`pwd`/assets/fonts:/usr/share/fonts" \
		pandoc/latex:2.10 -o $@ -d $^

# {{{1 PHONY
#      =====

styles :
	git clone https://github.com/citation-style-language/styles.git

clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml

# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
