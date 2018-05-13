;;; Задача 26: Определите функцию, разбивающую список (a b c d ...) на пары ((a b) (c d) ...).

(defun pair (li)
	(cond
		((null (cdr li)) li)
		(t (cons(list (car li) (cadr li)) (pair (cddr li))))
	)
)

(defun fprint (li)
	(format t "~a => ~a" li (pair li))
)

(fprint '(1 2 3 4 5)) ;	O: ((1 2) (3 4) 5)
(fprint '(a b c d e f g h)) ; O: ((A B) (C D) (E F) (G H))
(fprint '()); O: NIL


