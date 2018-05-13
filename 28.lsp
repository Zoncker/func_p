;28  Определите функцию, вычисляющую, сколько всего атомов в списке (списочной структуре).
 

(defun atom-сnt (l)
	(cond 
		((null l) 0)
		((atom (car l)) (+ 1 (atom-сnt (cdr l))))
		(t (atom-сnt (cdr l)))
	)
)



(defun print-pretty (l)
	(format t "~a => ~a" l (atom-сnt l))
)

(print-pretty '(2 91 1)) ;3
(print-pretty '(2 (3) (1) 1)) ;2