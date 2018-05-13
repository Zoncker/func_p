; 45. Определить расстояние между городами по координатам x и y

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

(defun fprint (city1 city2)
	(format t "City1 = ~a, City2 = ~a, distance => ~a~%" city1 city2 (dist city1 city2))
)

(set-city :city 'Odessa :x 1 :y 2)
(set-city :city 'Moscow :x 4 :y -2)

(fprint 'Odessa 'Moscow) ; 5
(fprint 'Odessa 'Odessa) ; 0
