#!/bin/sh

# Check for sbcl
which sbcl || { echo "`sbcl` executable not found."; exit 1; }

# Pull down quicklisp
[ ! -e quicklisp.lisp ] && wget https://beta.quicklisp.org/quicklisp.lisp

sbcl \
  $( [ -d "quicklisp" ] && printf %s "--load quicklisp/setup.lisp" ) \
  $( [ ! -d "quicklisp" ] && printf %s "--load quicklisp.lisp --eval '(quicklisp-quickstart:install :path \"./quicklisp\")'" ) \
  --eval '(ql:quickload :parenscript)' \
  --load build.lisp \
  --eval '(sb-ext:save-lisp-and-die "psbuild" :executable t
          :toplevel (lambda () (main sb-ext:*posix-argv*)))'
