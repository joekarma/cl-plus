;;;; cl+.asd

(asdf:defsystem #:cl+
  :serial t
  :description "CL+ is nothing more than a combination of pre-existing libraries. These libraries are bundled up in CL+ so that I don't have to list so many libraries in my USE forms."
  :author "Joe Taylor <taylor@c0de.co>"
  :license "BSD"
  :components ((:file "start")
               (:file "package")
               (:file "extensions")
               (:file "monkey")
               (:file "mixins")
               (:file "end"))
  :depends-on (:alexandria :anaphora :metabang-bind :cl-containers :cl-ppcre :cl-package-locks :hu.dwim.defclass-star

               :cl-interpol :cl-annot :cl-syntax

               :series :iterate

               :local-time :fset :optima :closer-mop

               :lparallel :bordeaux-threads :trivial-timeout

               :babel :iolib :osicat :inferior-shell :cl-fad

               :cl-unicode))

;; possibly including later: ironclad, fiveam, postmodern, restas, closure-html, drakma, stp-query, parenscript
