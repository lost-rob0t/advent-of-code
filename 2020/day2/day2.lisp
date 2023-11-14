(setq *input* (uiop:read-file-lines "input.txt"))

                                        ;(ql:quickload :smug)
(ql:quickload :re)

(setq *policy* (re:compile-re "(%d+)%-(%d+) (%a): (%a+)"))

(defun split-line (line)
  (let* ((policy (re:match-groups (re:match-re *policy* line)))
         (min (parse-integer (first policy)))
         (max (parse-integer (second policy))))
    (list :max max :min min :letter (char (third policy) 0) :password (fourth policy))))


(setq *password-lines* (loop for line in *input* collect (split-line line)))


(defun part1 (input)
  (count t  (loop for password in input
                  collect (let ((n (count (getf password :letter) (getf password :password))))
                            (and (>= n (getf password :min)) (<= n (getf password :max)))))))



(defun part2 (input)
  (count t  (loop for password in input
                  for letter = (getf password :letter)
                  for pos1 = (- (getf password :min) 1)
                  for pos2 = (- (getf password :max) 1)
                  for pass = (getf password :password)
                  for str = (list (char pass pos1) (char pass pos2))
                  do (format t "~a ~a: ~a~%" (char pass pos1) (char pass pos2) (not (and (char= letter (char pass pos1)) (char= letter (char pass pos2)))))
                  collect (= 1 (count letter str)))))
