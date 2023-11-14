(defun list-to-cons-pairs (lst)
  (if (null lst)
      nil
      (cons (cons (car lst) (cadr lst))
            (list-to-cons-pairs (cddr lst)))))





(defparameter input (mapcar #'parse-integer (uiop:read-file-lines "input.txt")))




(defun find-sum (list length sum)
  (alexandria:map-permutations #'(lambda (x) (when (= sum (reduce #'+ x))
                                               (return-from find-sum (reduce #'* x)))) list :length length))
