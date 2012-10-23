;;;; package.lisp

(in-package :org.tfeb.cl/conduits)

(defpackage #:cl+
  (:use #:split-sequence #:alexandria #:ppcre #:metabang-bind #:anaphora))

(import '(cl:nil) :cl+)
(export '(cl:nil) :cl+)

;;; overlay symbols in cl with those in closer-mop
(let (closer-mop-syms cl-syms)
  (do-external-symbols (s :cl)
    (push s cl-syms))
  (do-external-symbols (s :closer-mop)
    (push s closer-mop-syms))
  (dolist (s (set-difference cl-syms closer-mop-syms))
    (import s :cl+))
  (dolist (s (set-difference closer-mop-syms cl-syms))
    (import s :cl+)))

(dolist (package (package-use-list :cl+))
  (do-external-symbols (sym package)
    (export sym :cl+)))

