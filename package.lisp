;;;; package.lisp

(cl:defpackage #:cl+
  (:use :cl)
  (:import-from :hu.dwim.defclass-star #:defclass* #:defcondition*)
  (:export #:defclass* #:defcondition*)
  (:export #:symlook #:symcall #:symboundp)
  (:export #:reduce-series))

(syntax:define-package-syntax :cl+
  (:merge :standard)
  (:dispatch-macro-char #\# #\? #'cl-interpol::interpol-reader)
  (:dispatch-macro-char #\# #\% #'fset::|#%-reader|)
  (:dispatch-macro-char #\# #\$ #'fset::|#$-reader|)
  (:dispatch-macro-char #\# #\~ #'fset::|#~-reader|)
  (:dispatch-macro-char #\# #\[ #'fset::|#[-reader|)
  (:dispatch-macro-char #\# #\{ #'fset::|#{-reader|)
  (:dispatch-macro-char #\# #\@ #'cl-annot.syntax:annotation-syntax-reader)
  (:dispatch-macro-char #\# #\Z #'series::series-reader))

(cl:in-package :cl+)

(cl:do-symbols (sym :cl)
  (cl:export sym))

(cl:import '(cl:nil))
(cl:export '(cl:nil))

(cl:defvar *symbol-conflicts* '())

(cl:defun shadowing-combine-packages (packages)
  (cl:loop :for package :in packages
     cl:do (cl:loop :for sym :being :the external-symbols :in package
              :do (cl:when (cl:find-symbol (cl:symbol-name sym))
                    (cl:push (cl:list (cl:symbol-name sym)
                                      (cl:symbol-package (cl:find-symbol (cl:symbol-name sym)))
                                      (cl:symbol-package sym))
                             *symbol-conflicts*)
                    (cl:unintern (cl:find-symbol (cl:symbol-name sym))))
                  (cl:shadowing-import sym)
                  (cl:export sym))))

(shadowing-combine-packages '(#:cl #:cl-fad #:alexandria #:anaphora #:metabang-bind :cl-package-locks #:trivial-timeout
                              #:optima #:local-time #:fset #:closer-mop))

(series::install)

(cl:do-symbols (sym :cl+)
  (cl:when (cl:eql (cl:find-package :series)
                   (cl:symbol-package sym))
    (cl:export sym)))

(cl:defpackage :cl+-user
  (:use :cl+))

(cl:defpackage :cl+/iter)

(cl:in-package :cl+/iter)

(cl+::shadowing-combine-packages '(:cl+ :iter))
