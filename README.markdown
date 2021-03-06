# CL+

## Essential (Bad) Idea

This is not a library. It is merely a collection of libraries I
commonly `use` when defining my own packages. It exists for no other
reason than to save me some typing when composing defpackage forms.

Libraries in current `use` are as follows:

  1. conduit-packages
  2. closer-mop (merged with above)
  2. alexandria
  3. split-sequence
  5. metabang-bind
  6. anaphora

Anaphoric macros may be contentious among Lisp devs, but I like them,
and so have decided to include anaphora in the use list.

I chose not to `use` iterate or series because some of their symbols
conflict and I couldn't make a decision between the two. I'm leaning
towards iterate, however.
  
`use` CL+ in order to type this:

    (defpackage :foo
      (:use :cl+))
  
Instead of this:

    (defpackage :foo
      (:use :org.tfeb.cl/conduits :split-sequence :alexandria :anaphora :cl-fad)) ; etc.

Just in case you find yourself using iterate (or series) often, this
system creates two additional packages: CL+/ITERATE and CL+/SERIES

This "library" may in fact have been a retarded idea. But for now, it
works. Toss CL+ in local-projects and quickload it. It takes care of a
few common dependencies for you as well. Never again worry about
whether drakma or closure-html have been loaded! CL+ "depends" on
these packages, because I often rely on having them at hand.

The complete list of modules which are in CL+'s dependency list are as
follows:

    (:ALEXANDRIA :BORDEAUX-THREADS :CL-FAD :CL-INTERPOL :CL-PPCRE :CL-WHO :CL-UNIFICATION
     :CLOSER-MOP :CLOSURE-HTML :CONDUIT-PACKAGES :CXML :DRAKMA :HU.DWIM.DEFCLASS-STAR
     :INFERIOR-SHELL :ITERATE :NET-TELENT-DATE :OSICAT :PARENSCRIPT :SERIES :SIMPLE-DATE-TIME
     :SPLIT-SEQUENCE :METACOPY :ANAPHORA :METABANG-BIND)

I'm representing dates in my programs using the SIMPLE-DATE-TIME
library. I may use other date or time libraries as well, but dates
will be converted as appropriate, ultimately being represented using
SIMPLE-DATE-TIME's classes.
     
## Taking The (Bad) Idea To The Next Level

There are a few libraries which, for one reason or another, are
missing functions I desire. Rather than waiting for the library
maintainers to update their code, I've chosen to keep a collection of
monkey patches. My patches can be found in monkey.lisp

I recognize that this is probably a very bad idea, but I'm giving it a
try, and guess I'll just have to wait to get bitten.

Furthermore, I've included a few custom functions that might otherwise
be dumped in .sbclrc as extensions to CL+ itself. So far these include
SYMLOOK, SYMCALL, and SYMBOUNDP. The former attempts to find a symbol
in a given package. If the symbol (and package) are found, it returns
two values: the symbols value, and t. If however the symbol or package
is *not* found, rather than triggering an error this macro will
silently return two values: nil, and nil. SYMCALL is similar but works
with functions instead. Pass it a package name, a function name, and a
list of parameters, and it will take care of the &rest. SYMBOUNDP
simply tests whether a symbol is present or not in a given
package. Returns :external if it is present and exported, :internal if
it is merely present, else nil.