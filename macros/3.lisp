;;; 3. Определите лисповскую форму (IF условие p q) в виде макроса.

(defmacro ifm (condn yes no)
	`(if ,condn ,yes ,no)
)

(print (ifm (= 1 1) 'yes 'no))
(print (ifm (= 1 2) 'yes 'no))
