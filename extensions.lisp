(in-package :cl+)

(defun symbol-lookup (package-designator symbol &key (symbol-lookup-function #'symbol-value))
  (let ((return-value (list nil nil))
        value-of-symbol)
    (alexandria:when-let* ((package (find-package package-designator))
                           (found-symbol (find-symbol (symbol-name symbol)
                                                      package)))
      (setf value-of-symbol (ignore-errors (funcall symbol-lookup-function found-symbol)))
      (setf return-value
            (list value-of-symbol t)))
    (values-list return-value)))

(defun symbol-bound-p (package-designator symbol)
  (let ((package (find-package package-designator))
        found-symbol
        external-or-internal)
    (when package
     (multiple-value-setq (found-symbol external-or-internal)
       (find-symbol (symbol-name symbol)
                    package))
     external-or-internal)))

(defmacro symlook (package symbol)
  `(symbol-lookup (quote ,package) (quote ,symbol)))

(defmacro symcall (package symbol &rest parameters)
  (alexandria:with-gensyms (symbol-value symbol-present)
    `(multiple-value-bind (,symbol-value ,symbol-present)
         (symbol-lookup (quote ,package) (quote ,symbol) :symbol-lookup-function #'symbol-function)
       (if ,symbol-present
           (funcall ,symbol-value ,@parameters)
           (error (concatenate 'string
                               "Could not find function #'"
                               ,(symbol-name package)
                               "::"
                               ,(symbol-name symbol)))))))

(defmacro symboundp (package sym)
  `(symbol-bound-p (quote ,package)
                   (quote ,sym)))
