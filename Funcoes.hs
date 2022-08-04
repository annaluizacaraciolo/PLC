-- questão 1
dobro :: Integer -> Integer 
dobro x = 2 * x

-- questão 2
quadruplo :: Integer -> Integer
quadruplo y = dobro (dobro y)

-- questão 3
poli2 :: Double -> Double -> Double -> Double  -> Double 
poli2 a b c x = a * x**2 + b * x + c

-- questão 4
parImpar :: Integer -> String
parImpar x = if (x `mod` 2 == 0) then "par" else "impar"

-- questão 5
maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c = max (max a b) c

maxFour :: Integer -> Integer -> Integer -> Integer -> Integer
maxFour a b c d = max (maxThree a b c) d

-- questão 6
quantosIguais :: Integer -> Integer -> Integer -> Integer
quantosIguais a b c
    | a == b && a == c = 3
    | a == b && a /= c = 2
    | a == c = 2
    | b == c = 2
    | otherwise = 0

-- questão 7
ehZero :: Int -> Bool
ehZero 0 = True
ehZero _ = False

-- questão 8
sumTo :: Integer -> Integer
sumTo 0 = 0
sumTo n = n + sumTo(n-1)

-- questão 9
potencia :: Integer -> Integer -> Integer
potencia _ 0 = 1
potencia n 1 = n
potencia n k = n * potencia n (k-1) -- esses parênteses são importantes

-- questão 10
binomio n 0 = 1
binomio 0 k = 0
binomio n k = binomio (n-1) k + binomio (n-1) (k-1)

-- questão 11
tribonacci :: Integer -> Integer
tribonacci 1 = 1
tribonacci 2 = 1
tribonacci 3 = 2
tribonacci n = tribonacci (n-1) + tribonacci (n-2) + tribonacci (n-3)

-- questão 12
addEspacos :: Int -> String
addEspacos 0 = ""
addEspacos n = " " ++ addEspacos (n-1)

-- questão 13
paraDireita :: Int -> String -> String
paraDireita 0 s = "" ++ s
paraDireita n s = " " ++ paraDireita (n-1) s

