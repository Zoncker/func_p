; 6. Определить фильтр (remove-if предикат список), удаляющий из списка все элементы, на которые предикат отвечает True

(defun rm-if (predi arr)
	(mapcan
		(lambda (x to-rm)
			(if to-rm Nil (list x))
		)
		arr (mapcar predi arr)
	)
)

(defun fprint (arr)
	(format t "~a, rm even => ~a~%" arr (rm-if 'evenp arr))
)

(fprint '(1 2 3 4 5 6)) ;(1 3 5)
(fprint '(7 9 7 2 9)) ;(7 9 7 9)

