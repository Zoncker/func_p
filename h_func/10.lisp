;;; 10. Написать генератор последовательности (А) (В А) (А В А)...

(defun generator ()
	(let
		((cur "A") (seq Nil))
		(lambda () (and
			(setq seq (cons cur seq))
			(if (equal cur "A")
				(setq cur "B")
				(setq cur "A")
			)
			seq
		))
	)
)

(setq next1 (generator))
(setq next2 (generator))

(defun print-pretty (gen)
	(format t "Generage next => ~a~%" (funcall gen))
)

(format t "next1:~%")
(print-pretty next1)
(print-pretty next1)
(print-pretty next1)
(print-pretty next1)
(print-pretty next1)

(terpri)
(format t "next2:~%")
(print-pretty next2)
(print-pretty next2)
(print-pretty next2)
(print-pretty next2)
(print-pretty next2)

#|
next1:
Generage next => (A)
Generage next => (B A)
Generage next => (A B A)
Generage next => (B A B A)
Generage next => (A B A B A)

next2:
Generage next => (A)
Generage next => (B A)
Generage next => (A B A)
Generage next => (B A B A)
Generage next => (A B A B A)
|#