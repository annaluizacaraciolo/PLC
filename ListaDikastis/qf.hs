ehPar :: Int -> [Int] -> [Int] -> [Int]
ehPar x [left] [right]
    | mod x 2 == 0 = x : [left]
    | otherwise = x : [right]

{- metade :: Num a => [a] -> ([a],[a])
metade (x:xs)
    | mod x 2 == 0 = (x : [metade xs], [metade xs])
    | otherwise = ([metade xs], x : [metade xs])
-}