merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys =  ys
merge (x:xs) (y:ys)
    | x > y = y : merge (x:xs) ys 
    | otherwise = x : merge xs (y:ys)