; 2. Определить функционал (MAPLIST fn список)

(defun maplst (fn arr)
	(cond
		((null arr) Nil)
		(T (cons (funcall fn arr) (maplst fn (cdr arr))))
	)
)

(print (maplst 'identity '(1 2 3 4))) ;((1 2 3 4) (2 3 4) (3 4) (4))
