; 39. Сформировать множество из элементов, которые не входят в оба множества

(defun cont (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			T
			(cont (cdr arr) val)
		)
	)
)

(defun not-in (arr1 arr2)
	(defun iter (arr1 arr2)
		(if (null arr1) 
			Nil
			(let
				(
					(head (car arr1))
					(tail (cdr arr1))
				)
				(if (cont arr2 head)
					(iter tail arr2)
					(cons head (iter tail arr2))
				)
			)
		)
	)
	(append
		(iter arr1 arr2)
		(iter arr2 arr1)
	)
)

(defun fprint (arr1 arr2)
	(format t "List1 = ~a, List2 = ~a, diff => ~a~%" arr1 arr2 (not-in arr1 arr2))
)

(fprint '(1 2 3 4) '(5 2 3 8)) ; (1 4 5 8)
(fprint '(1 2 3) '(3 2 1)) ; Nil
(fprint '(1 2 3) Nil) ; (1 2 3)
(fprint '(1 2) '(3 4 5)) ; (1 2 3 4 5)
