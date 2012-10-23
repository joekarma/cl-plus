;;;; cl+.asd

(asdf:defsystem #:cl+
  :serial t
  :description "CL+ is nothing more than a combination of pre-existing libraries. These libraries are bundled up in CL+ so that I don't have to list so many libraries in my USE forms."
  :author "Joe Taylor <taylor@c0de.co>"
  :license "BSD"
  :components ((:file "package")
               (:file "monkey"))
  :depends-on (:ALEXANDRIA :BORDEAUX-THREADS :CL-FAD :CL-INTERPOL :CL-PPCRE :CL-WHO
               :CLOSER-MOP :CLOSURE-HTML :CONDUIT-PACKAGES :CXML :DRAKMA :INFERIOR-SHELL
	       :ITERATE :NET-TELENT-DATE :OSICAT :SERIES :SIMPLE-DATE-TIME
	       :SPLIT-SEQUENCE :METACOPY
	       :ANAPHORA :METABANG-BIND))

