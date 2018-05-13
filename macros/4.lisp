;;; 4. Определите в виде макроса форму (FIF тест отр нуль полож).

(defmacro fif (test minus zero plus)
	`(if (> ,test 0)
		,plus
		(if (< ,test 0)
			,minus
			,zero
		)
	)
)

(print (macroexpand '(fif -5 'minus 'zero 'plus)))
(print (fif -5 'minus 'zero 'plus))
(print (fif 0 'minus 'zero 'plus))
(print (fif 5 'minus 'zero 'plus))

