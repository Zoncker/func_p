; 47. Удалить все свойства символа

(defun remove-props (obj)
	(let
		((props (symbol-plist obj)))
		(cond
			((null props) Nil)
			(T
				(remprop obj (car props))
				(remove-props obj)
			)
		)
	)
)

(defun fprint (city)
	(format t "City = ~a, prop => ~a~%" city (symbol-plist city))
	(remove-props city)
	(format t "after => ~a~%" (symbol-plist city))
	(terpri)
)

(setf (get 'Odessa 'x) 1)
(setf (get 'Odessa 'y) 2)
(setf (get 'Odessa 'alias) "South Palmira")
(setf (get 'Moscow 'x) 4)
(setf (get 'Moscow 'y) -2)
(setf (get 'Moscow 'country) "Russia")

(fprint 'Odessa)
(fprint 'Moscow)
