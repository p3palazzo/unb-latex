vpath %.yaml .:_spec

PANDOC/LATEX := docker run -u "`id -u`:`id -g`" \
		-v "`pwd`:/data" -v "`pwd`/assets/fonts:/usr/share/fonts" \
		pandoc/latex:2.16.1

artigo.pdf : artigo.md pdf.yaml bibliografia.yaml
	$(PANDOC/LATEX) -o $@ -d _spec/pdf.yaml $<

.PHONY : clean
clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
