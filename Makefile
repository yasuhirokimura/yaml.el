EMACS=	emacs
INSTALL=install -m 644 -p
RM=	rm -f

ELCS=	yaml.elc

.SUFFIXES: .el .elc

.el.elc:
	${EMACS} -Q -batch -L . -f batch-byte-compile $<

all: ${ELCS}

install: ${ELCS}
	${INSTALL} yaml.el* $$(${EMACS} -Q --batch --eval "(princ (expand-file-name \"../../site-lisp\" data-directory))")

clean:
	${RM} ${ELCS}
