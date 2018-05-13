; 8. Генератор натуральных чисел 1 2 3...

(defun generator ()
	(let
		((x 0))
		(lambda () (setq x (+ x 1)))
	)
)

(defun fprint (gen)
	(format t "Next => ~a~%" (funcall gen))
)

(setq next-number1 (generator))
(setq next-number2 (generator))

(format t "next-number1:~%")
(fprint next-number1) ;1	
(fprint next-number1) ;2
(fprint next-number1) ;3

(format t "~%next-number2:~%")
(fprint next-number2) ;1
(fprint next-number2) ;2
(fprint next-number2) ;3
