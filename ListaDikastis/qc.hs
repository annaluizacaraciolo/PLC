{- 
has ::  Int -> [Int] -> Bool
has a [] = False
has a (x:xs)
    | x == a = True
    | otherwise = has a xs

unicos :: [Int] -> [Int]
unicos [] = []
unicos (x:xs)
    | has x xs == True = unicos xs
    | otherwise = x : unicos xs

-}

occurred ::  Int -> [Int] -> Bool
occurred a [] = False
occurred a (x:xs)
    | x == a = True
    | otherwise = occurred a xs

unicos :: [Int] -> [Int]
unicos [] = []
unicos (x:xs)
    | occurred x xs == True = unicos xs
    | otherwise = x : unicos xs