;;;; package.lisp

(in-package :org.tfeb.cl/conduits)

(defpackage #:cl+
  (:use #:split-sequence #:alexandria #:ppcre #:metabang-bind #:anaphora))

(import '(cl:nil) :cl+)
(export '(cl:nil) :cl+)

;;; overlay symbols in cl with those in closer-mop
(let (closer-mop-syms cl-syms)
  (do-external-symbols (s :org.tfeb.cl/conduits)
    (push (string s) cl-syms))
  (do-external-symbols (s :closer-mop)
    (push (string s) closer-mop-syms))
  (dolist (s (set-difference cl-syms closer-mop-syms :test #'string=))
    (import (intern s :org.tfeb.cl/conduits) :cl+)
    (export (intern s :org.tfeb.cl/conduits) :cl+))
  (dolist (s (set-difference closer-mop-syms cl-syms :test #'string=))
    (import (intern s :closer-mop) :cl+)
    (export (intern s :closer-mop) :cl+))
  (dolist (s (intersection closer-mop-syms cl-syms :test #'string=))
    (import (intern s :closer-mop) :cl+)
    (export (intern s :closer-mop) :cl+)))

(dolist (package (package-use-list :cl+))
  (do-external-symbols (sym package)
    (export sym :cl+)))

#+SB-PACKAGE-LOCKS (sb-ext:lock-package :cl+)
