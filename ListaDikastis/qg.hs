merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge xs [] = xs
merge [] ys =  ys
merge (x:xs) (y:ys)
    | x > y = y : merge (x:xs) ys 
    | otherwise = x : merge xs (y:ys)

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort (xs) = merge (msort (left xs)) (msort (right xs))

left xs = let { n = length xs} in take (div n 2) xs
right xs = let {n = length xs} in drop (div n 2) xs