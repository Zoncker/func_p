-- Задача 26: Определите функцию, разбивающую список [1, 2, 3, 4, ...] на пары [[1, 2], [3, 4], ...].

pair :: [Integer] -> [[Integer]]
pair [] = []
pair (first:second:tail) = [first, second]:(pair tail)

-- I: main = print $ (pair [1, 2, 3, 4, 5, 6, 7, 8])
-- O: [[1, 2], [3, 4], [5, 6], [7, 8]]