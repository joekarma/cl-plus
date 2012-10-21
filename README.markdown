CL+
---

This is not a library. It is merely a collection of libraries I
commonly `:use` when defining my own packages. It exists for no other
reason than to save me some typing when composing defpackage forms.

Libraries in current `:use` are as follows:

  1. conduit-packages
  2. alexandria
  3. iterate
  4. split-sequence
  5. CL-PPCRE
  
`:use` CL+ in order to type this:

    (defpackage :foo
      (:use :cl+))
  
Instead of this:

    (defpackage :foo
      (:use :org.tfeb.cl/conduits :iterate :split-sequence :alexandria :cl-ppcre))

This "library" may in fact have been a retarded idea.  