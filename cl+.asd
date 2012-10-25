;;;; cl+.asd

(asdf:defsystem #:cl+
  :serial t
  :description "CL+ is nothing more than a combination of pre-existing libraries. These libraries are bundled up in CL+ so that I don't have to list so many libraries in my USE forms."
  :author "Joe Taylor <taylor@c0de.co>"
  :license "BSD"
  :components ((:file "package")
               (:file "monkey"))
  :depends-on (:ALEXANDRIA :BORDEAUX-THREADS :CL-FAD :CL-INTERPOL :CL-PPCRE :CL-WHO :CL-UNIFICATION
               :CLOSER-MOP :CLOSURE-HTML :CONDUIT-PACKAGES :CXML :DRAKMA :HU.DWIM.DEFCLASS-STAR
               :INFERIOR-SHELL :ITERATE :NET-TELENT-DATE :OSICAT :PARENSCRIPT :SERIES :SIMPLE-DATE-TIME
	       :SPLIT-SEQUENCE :METACOPY :ANAPHORA :METABANG-BIND))
  ;; Other favourites include: cl-smtp, external-program, [buildnode / emit-xml], restas,
  ;; cl-unicode, postmodern, elephant, fset, stp-query, trivial-timeouts, cl-store, 5am


