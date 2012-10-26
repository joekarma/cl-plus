(in-package :cl+)

(defun symbol-lookup (package-designator symbol &key (test #'symbol-value))
  (let ((return-value (list nil nil))
        (package (find-package package-designator))
        found-symbol
        value-of-symbol)
    (when package
      (setf found-symbol (find-symbol (symbol-name symbol)
                                      package))
      (when found-symbol
        (setf value-of-symbol (ignore-errors (funcall test found-symbol)))
        (setf return-value
              (list value-of-symbol t))))
    (values-list return-value)))

(defmacro symlook (package symbol)
  `(symbol-lookup (quote ,package) (quote ,symbol)))

(defmacro symcall (package symbol &rest parameters)
  (alexandria:with-gensyms (symbol-value symbol-present)
    `(multiple-value-bind (,symbol-value ,symbol-present)
         (symbol-lookup (quote ,package) (quote ,symbol) :test #'symbol-function)
       (if ,symbol-present
           (funcall ,symbol-value ,@parameters)
           (error (concatenate 'string
                               "Could not find function #'"
                               ,(symbol-name package)
                               "::"
                               ,(symbol-name symbol)))))))
