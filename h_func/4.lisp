; 4. Определить функциональный предикат (every предикат список), который верен, если все верны

(defun evry (predi arr)
	(null
		(mapcan (lambda (x) (if (null x) (list T) Nil))
			(mapcar predi arr)
		)
	)
)

(defun fprint (arr)
	(format t "List = ~a, even => ~a~%" arr (evry 'evenp arr))
)

(fprint '(2 6 8 10)) ;T
(fprint '(2 6 9 10)) ;nil