CL+
---

This is not a library. It is merely a collection of libraries I
commonly `:use` when defining my own packages. It exists for no other
reason than to save me some typing when composing defpackage forms.

Libraries in current `:use` are as follows:

  1. conduit-packages
  2. alexandria
  3. split-sequence
  4. CL-PPCRE

I chose not to `:use` iterate or series because some of their symbols
conflict and I couldn't make a decision between the two.
  
`:use` CL+ in order to type this:

    (defpackage :foo
      (:use :cl+))
  
Instead of this:

    (defpackage :foo
      (:use :org.tfeb.cl/conduits :split-sequence :alexandria :cl-ppcre))

This "library" may in fact have been a retarded idea. But for now, it
works. Toss CL+ in local-projects and quickload it. It takes care of a
few common dependencies for you as well. Never again worry about
whether drakma or closure-html have been loaded! CL+ "depends" on
these packages, because I rely on having them at hand.