incr :: [Integer] -> [Integer]
incr [] = []
incr (head:tail) = (head + 1):(incr tail)

-- I: main = print $ (incr [1, 2, 3])
-- O: [2, 3, 4]