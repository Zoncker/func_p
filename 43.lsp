;43 Найти количество вершин дерева заданной высоты

(defun apex-count (tree lv)
	(cond 
		((null tree) 0)
		((zerop lv) 1)
		(t (+ (apex-count (car tree) (- lv 1)) (apex-count (caddr tree) (- lv 1))))
	)
)

(defun fprint (tree lv)
	(format t "level ~d of tree ~a => ~a" lv tree (apex-count tree lv))
)
(fprint '(((1 2 3) 6 ((1) -8 (2))) 7 (nil 12 nil)) 3);4
(fprint '((1 2) 3) 1) ;1
(fprint '((1 2 4) 3) 2) ;2