(in-package :cl+)

;;; mixins go here

(defmacro reduce-series (fn series &key (initial-value nil initial-value-provided-p) (key nil key-provided-p))
  (once-only (fn series key)
    (with-gensyms (x)
      `(collect-fn t
                   (lambda () ,(if initial-value-provided-p initial-value `(collect-first ,series)))
                   ,(if key-provided-p
                        `(lambda (,x) (funcall ,key ,x))
                        fn) 
                   ,series))))
