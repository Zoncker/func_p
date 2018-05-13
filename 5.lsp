;;; Задача 5: Определите функцию, которая увеличивает элементы исходного списка на единицу.

(defun inc(li)
	(cond 
		( (null li) nil )
		( t (cons (+(car li) 1) (inc(cdr li))))
	) 
)

(defun fprint (li)
	(format t "~a => ~a" li (inc li))
)

(fprint '(1 2 3 4 5))
