; 9 Определите функцию, разделяющую исходный список на два подсписка. 
;	В первый из них должны попасть элементы с нечетными номерами, во второй — элементы с четными номерами. 


(defun index (e arr)
	(cond 
		((eq e (car arr)) 0)
		(t (+ 1 (index e (cdr arr))))
	)
)
(defun even (d)
    (if (= (mod d 2) 0) t nil)
)

(defun neven (d)
    (if (/= (mod d 2) 0) t nil)
)


(defun split (l) 
	(list
	    (mapcan (lambda (e) (if (even (index e l)) (list e) nil)) l)
	    (mapcan (lambda (e) (if (neven (index e l)) (list e) nil)) l)	   
))

(defun fprint (l)
	(format t "a => ~a" l (split l))
)

(fprint '(2 5 1 10 9)) ; (2 1 9) (5 10)