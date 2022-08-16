remDiv:: Int -> [a] -> ([a],[a])
remDiv n x = (take (n-1) x, drop n x)