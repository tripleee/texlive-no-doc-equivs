PACKAGES := texlive-latex-base-doc \
	 texlive-fonts-recommended-doc \
	 texlive-latex-extra-doc \
	 texlive-latex-recommended-doc \
	 texlive-pictures-doc \
	 texlive-pstricks-doc

DST ?= .

ALL := $(patsubst %,%.built,$(PACKAGES)) texlive-no-doc.built

.PHONY: all export
all: $(ALL)

export: all
	cp *.deb $(DST)/

%.built: %.control
	 equivs-build $<
	 touch $@

%.control: texlive-no-doc.control
	sed -n -e 's/^Package: .*/Package: $*/' \
	    -e 's/^Version: */& 99:/' -e '/^Depends:/q' -e p $< >$@
