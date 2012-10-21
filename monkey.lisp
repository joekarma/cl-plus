(in-package #:cl+)

(unless (fboundp 'dt::parse-date)
  (defun dt::parse-date (string)
    (let ((date (dt:from-universal-time
                 (date:parse-time string))))
      (setf (dt:hour-of date) 0)
      (setf (dt:minute-of date) 0)
      (setf (dt:second-of date) 0)
      (setf (dt:millisecond-of date) 0)
      date))
  (export 'dt::parse-date :dt))

