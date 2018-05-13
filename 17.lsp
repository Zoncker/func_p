;17
; Вставить a во все позиции r:
 
(defun ins-in-all-pos (a l r)
	(cond
		((null r) (list (append l (list a))))
		(t (cons (append l (list a) r) (ins-in-all-pos a (append l (list (car r))) (cdr r))))
	)
)
 
==> INS-IN-ALL-POS
 
; Перестановки
 
(defun all-perms (lst)
	(cond 
		((null (cdr lst)) (list lst))
		(t (apply 'append (mapcar (lambda (x) (ins-in-all-pos (car lst) nil x)) (all-perms (cdr lst)))))
	)
)
 
==> ALL-PERMS
 
(all-perms '(a b)) ;((A B) (B A))
 
(all-perms '(a b c)) ;((A B C) (B A C) (B C A) (A C B) (C A B) (C B A))

(all-perms '(a b c d)) ;((A B C D) (B A C D) (B C A D) (B C D A) (A C B D) (C A B D) (C B A D) (C B D A) (A C D B) (C A D B) (C D A B) (C D B A) (A B D C) (B A D C) (B D A C) (B D C A) (A D B C) (D A B C) (D B A C) (D B C A) (A D C B) (D A C B) (D C A B) (D C B A))
 
