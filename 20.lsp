;20. Определите функцию нахождения первого атома списка.

(defun first-atom (lst)
	(cond 
		((atom (car lst)) (car lst))
		(t (first-atom (car lst)))
	)
) 

(defun fprint (lst)
	(format t "~a => ~a" lst (first-atom lst))
)

(fprint '((((((x) y) z) t) w) q))
; x

(fprint '(a b c d e f g h))
; a