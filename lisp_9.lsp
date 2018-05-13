|# 9+  Определите функцию, разделяющую исходный список на два подсписка. 
	В первый из них должны попасть элементы с нечетными номерами, во второй — элементы с четными номерами. 
 |#

(defun index (e arr)
	(cond 
		((eq e (car arr)) 0)
		(t (+ 1 (index e (cdr arr))))
	)
)
(defun isEven (d)
    (if (= (mod d 2) 0) t nil)
)

(defun isNotEven (d)
    (if (/= (mod d 2) 0) t nil)
)


(defun split (l) 
	(list
	    (mapcan (lambda (e) (if (isEven (index e l)) (list e) nil)) l)
	    (mapcan (lambda (e) (if (isNotEven (index e l)) (list e) nil)) l)	   
))

(defun print-pretty (l)
	(format t " => ~a" (split l))
)

(print-pretty '(2 5 1 10 9))

;;; Задача 5: Определите функцию, которая увеличивает элементы исходного списка на единицу.

(defun inc(li)
	(cond 
		( (null li) nil )
		( t (cons (+(car li) 1) (inc(cdr li))) )
	) 
)


;;; Задача 26+: Определите функцию, разбивающую список (a b c d ...) на пары ((a b) (c d) ...).

(defun couples (li)
	(cond
		((null (cdr li)) li)
		(t (cons(list (car li) (cadr li)) (couples (cddr li))))
	)
)

;~- Test cases

;	Input: (couples '())
;	Output: NIL

;	Input: (couples '(a b c d e f g h))
;	Output: ((A B) (C D) (E F) (G H))

;	Input: (couples '(1 2 3 4 5))
;	Output: ((1 2) (3 4) 5)


;17

;; Вставить a во все позиции r:
 
(defun ins-in-all-pos (a l r)
	(cond
		((null r) (list (append l (list a))))
		(t (cons (append l (list a) r) (ins-in-all-pos a (append l (list (car r))) (cdr r))))
	)
)
 
==> INS-IN-ALL-POS
 
;; Перестановки
 
(defun all-perms (lst)
	(cond 
		((null (cdr lst)) (list lst))
		(t (apply 'append (mapcar (lambda (x) (ins-in-all-pos (car lst) nil x)) (all-perms (cdr lst)))))
	)
)
 
==> ALL-PERMS
 
(all-perms '(a b))
 
==> ((A B) (B A))
 
(all-perms '(a b c))
 
==> ((A B C) (B A C) (B C A) (A C B) (C A B) (C B A))
 
(all-perms '(a b c d))
 
==> ((A B C D) (B A C D) (B C A D) (B C D A) (A C B D) (C A B D) (C B A D) (C B D A) (A C D B) (C A D B) (C D A B) (C D B A) (A B D C) (B A D C) (B D A C) (B D C A) (A D B C) (D A B C) (D B A C) (D B C A) (A D C B) (D A C B) (D C A B) (D C B A))


(defun ff (lst x)
  (cond ((null lst) (list (list x)))
        (t (append (list (cons x lst)) (mapcar #'(lambda (y) (cons (car lst) y)) (ff (cdr lst) x))))))
 
==> ff
 
(defun perm (lst)
  (cond ((null lst) (list nil))
        (t (let ((aperm (perm (cdr lst)))
                 (a (car lst)))
                (apply 'append (mapcar #'(lambda (x) (ff x a)) aperm))))))   
 
==> perm
 
(perm '(a b c d))
 
==> ((a b c d) (b a c d) (b c a d) (b c d a) (a c b d) (c a b d) (c b a d) (c b d a) (a c d b) (c a d b) (c d a b) (c d b a) (a b d c) (b a d c) (b d a c) (b d c a) (a d b c) (d a b c) (d b a c) (d b c a) (a d c b) (d a c b) (d c a b) (d c b a))





;20
(defun first-atom (lst)
	(cond 
		((atom (car lst)) (car lst))
		(t (first-atom (car lst)))
	)
)

==> first-atom
 
(first-atom '((((((x) y) z) t) w) q))
 
==> x

;28

|#    Определите функцию, вычисляющую, сколько всего атомов в списке (списочной структуре).
 |#

(defun atom-сnt (l)
	(cond 
		((null l) 0)
		((atom (car l)) (+ 1 (atom-сnt (cdr l))))
		(t (atom-сnt (cdr l)))
	)
)

(atom-сnt '(2 91 1))
(atom-сnt '(2 (3) 1 1))


(defun atom-сnt (l)
	(cond 
		((null l) 0)
		((atom (car l)) (+ 1 (atom-сnt (cdr l))))
		(t (atom-сnt (cdr l)))
	)
)



(defun print-pretty (l)
	(format t " => ~a" (atom-сnt l))
)

(print-pretty '(2 91 1))
(print-pretty '(2 (3) (1) 1))


;;; 39. Сформировать множество из элементов, которые не входят в оба множества

(defun contains (arr val)
	(if (null arr)
		Nil
		(if (= (car arr) val)
			T
			(contains (cdr arr) val)
		)
	)
)

(defun not-in (arr1 arr2)
	(defun iterate (arr1 arr2)
		(if (null arr1) 
			Nil
			(let
				(
					(head (car arr1))
					(tail (cdr arr1))
				)
				(if (contains arr2 head)
					(iterate tail arr2)
					(cons head (iterate tail arr2))
				)
			)
		)
	)
	(append
		(iterate arr1 arr2)
		(iterate arr2 arr1)
	)
)

(defun print-pretty (arr1 arr2)
	(format t "List1 = ~a, List2 = ~a, symmetric difference => ~a~%" arr1 arr2 (not-in arr1 arr2))
)

(print-pretty '(1 2 3 4) '(5 2 3 8)) ; (1 4 5 8)
(print-pretty '(1 2 3) '(3 2 1)) ; Nil
(print-pretty '(1 2 3) Nil) ; (1 2 3)
(print-pretty '(1 2) '(3 4 5)) ; (1 2 3 4 5)

#|
Список1 = (1 2 3 4), Список2 = (5 2 3 8), симметричная разность => (1 4 5 8)
Список1 = (1 2 3), Список2 = (3 2 1), симметричная разность => NIL
Список1 = (1 2 3), Список2 = NIL, симметричная разность => (1 2 3)
Список1 = (1 2), Список2 = (3 4 5), симметричная разность => (1 2 3 4 5)
|#

;43
(defun tree-count (tree lv)
  (cond ((null tree) 0)
        ((zerop lv) 1)
        (t (+ (tree-count (car tree) (- lv 1))
              (tree-count (caddr tree) (- lv 1))))))
 
==> tree-count
 
(tree-count '(((nil 2 nil) 6 ((1) -8 (2))) 7 (nil 12 nil)) 1)
 
==> 2
 
(tree-count '(((nil 2 nil) 6 (nil -8 nil)) 7 (nil 12 nil)) 2)
 
==> 2
 
(tree-count '(((nil 2 nil) 6 (nil -8 nil)) 7 (nil 12 nil)) 3)
 
==> 0


(defun tree-count (tree lv)
  (cond ((null tree) 0)
        ((zerop lv) 1)
        (t (+ (tree-count (car tree) (- lv 1))
              (tree-count (caddr tree) (- lv 1))))
  )
)

(defun print-pretty (tree lv)
	(format t " => ~a" (tree-count tree lv))
)
(print-pretty '(((1 2 3) 6 ((1) -8 (2))) 7 (nil 12 nil)) 3)
(print-pretty '((1 2) 3) 1)
(print-pretty '((1 2 4) 3) 2)


;;; 45. Определить расстояние между городами по координатам x и y

(defun dist (city1 city2)
	(let
		(
			(x1 (get city1 'x))
			(y1 (get city1 'y))
			(x2 (get city2 'x))
			(y2 (get city2 'y))
		)
		(sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2)))
	)
)

(defun set-city (&key city x y)
	(setf (get city 'x) x)
	(setf (get city 'y) y)
)

(defun print-pretty (city1 city2)
	(format t "City1 = ~a, City2 = ~a, distance => ~a~%" city1 city2 (dist city1 city2))
)

(set-city :city 'Simfer :x 1 :y 2)
(set-city :city 'Piter :x 4 :y -2)

(print-pretty 'Simfer 'Piter) ; 5
(print-pretty 'Simfer 'Simfer) ; 0

#|
Город1 = SIMFER, Город2 = PITER, расстояние => 5
Город1 = SIMFER, Город2 = SIMFER, расстояние => 0
|#


;;; 47. Удалить все свойства символа

(defun remove-svoystva (object)
	(let
		((svoystva (symbol-plist object)))
		(cond
			((null svoystva) Nil) ;return
			(T
				(remprop object (car svoystva))
				(remove-svoystva object)
			)
		)
	)
)

(defun print-pretty (city)
	(format t "City = ~a, property => ~a~%" city (symbol-plist city))
	(remove-svoystva city)
	(format t "Properties after removal => ~a~%" (symbol-plist city))
	(terpri)
)

(setf (get 'Simfer 'x) 1)
(setf (get 'Simfer 'y) 2)
(setf (get 'Simfer 'region) "Crimea")
(setf (get 'Piter 'x) 4)
(setf (get 'Piter 'y) -2)
(setf (get 'Piter 'country) "Russia")

(print-pretty 'Simfer)
(print-pretty 'Piter)

#|
Город = SIMFER, свойства => (REGION Crimea Y 2 X 1)
Свойства после удаления => NIL

Город = PITER, свойства => (COUNTRY Russia Y -2 X 4)
Свойства после удаления => NIL
|#


;;;; 47) Remove all symbol properties

(setq *print-case* :downcase)

(defun get-props-names (sym)
	(defun iterate (props)
		(if (null props)
			Nil
			(cons (car props) (iterate (cddr props)))
		)
	)
	(iterate (symbol-plist sym))
)

(defun iterate-list (arr fun)
	(cond 
		((null arr) Nil)
		(T
			(funcall fun (car arr))
			(iterate-list (cdr arr) fun)
		)
	)
)

(defun clear-props (sym)
	(iterate-list (get-props-names sym)
		(lambda (prop)
			(remprop sym prop)
		)
	)
)

(defun clear-props-and-show (sym)
	(clear-props sym)
	(symbol-plist sym)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(setf (get 'Sym 'a) 5)
(setf (get 'Sym 'b) "Hello!")
(setf (get 'Sym 'c) 'Another-symbol)
(setf (get 'Sym 'd) Nil)

(output 'clear-props-and-show 'Sym) ; Nil

