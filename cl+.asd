;;;; cl+.asd

(asdf:defsystem #:cl+
  :serial t
  :description "CL+ is nothing but a combination of pre-existing libraries. These libraries
are bundled up in CL+ so I don't have to list so many libraries in my :use forms."
  :author "Joe Taylor <taylor@c0de.co>"
  :license "BSD"
  :components ((:file "package"))
  :depends-on (:alexandria :iterate
               :cl-ppcre))

