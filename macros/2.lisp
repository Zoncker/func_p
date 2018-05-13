; 2. Определите макрос (POP стек), который читает из стека верхний элемент
;   и меняет значение переменной стека.

(defmacro popm (stack)
	`(let
		(
			(top 0)
		)
		(setq top (car ,stack))
		(setq ,stack (cdr ,stack))
		top
	)
)

(setq stack (list 'one 'two 'three))
(print (popm stack))
(print (popm stack))
(print (popm stack))