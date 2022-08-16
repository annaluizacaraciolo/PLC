numDiv:: Integral a => a -> a -> a
numDiv dividendo divisor
    | mod dividendo divisor == 0 = 1 + numDiv (div dividendo divisor) divisor
    | otherwise = 0