(defun print-list-elements (list)
  (while list
    (print (car list))
    (setq list (cdr list))))
