import Data.Char

-- Exemplo de uso de anonymous function com map 
somaQuadrado :: [Int] -> Int 
somaQuadrado (x:xs) = foldl (+) 0 (map (\y -> y^2) (x:xs))

-- função de quadrado anterior
quadrado :: [Int] -> [Int]
quadrado (x:xs) = map (\y -> y^2) (x:xs)

-- Insertion sort dado em aula
{-isSort :: [Int] -> [Int]
isSort [] = []
isSort (x:xs) = ins x (isSort xs)

ins :: Int -> [Int] -> [Int]
ins x [] = [x]
ins x (y:ys)
    | 

-}

-- reverse list
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

-- uso do map, filter e fold
somaDupla :: Num a => [(a,a)] -> [a]
somaDupla xs = map (\(a,b) -> a + b) xs

-- questões da lista de listas
-- questão 1
paraMaiuscula :: String -> String
paraMaiuscula (x:xs) = [toUpper x | x <- (x:xs)]

-- questão 2
divisores :: Integer -> [Integer]
divisores n = [x | x <- [1..n], n `mod` x == 0]


-- questão 3
menorLista  :: [Int] -> Int 
menorLista (x:xs) = foldl (min) x xs

-- questão 4
fibTable :: Integer -> Integer
fibTable 0 = 0 
fibTable 1 = 1
fibTable 2 = 1
fibTable n = fibTable (n-1) + fibTable (n-2)

-- questão 5
measure :: [a] -> Int 
measure [] = 0
measure (x:xs) = 1 + measure xs

-- questão 6
takeFinal  :: Int -> [a] -> [a]
takeFinal n xs = reverse (take n (reverse xs))

-- takeFinal sem funções reverse e take 
takeFinal' :: Int -> [a] -> [a]
--takeFinal' _ [] = []
takeFinal' 0 xs = xs
takeFinal' n (x:xs) = if length xs == n then xs else takeFinal' n xs

-- questão 8
q8 :: [Int] -> Int 
q8 [] = 0
q8 (x:xs) = x+1

-- questão 10
produto :: [Integer] -> Integer 
--produto (x:xs) = if [] then 0 else foldl (+) x xs
produto [] = 0
produto (x:xs) = foldl (+) x xs

-- questão 11
--unique :: [Integer] -> [Integer]

-- questão 12
ehCrescente :: [Integer] -> Bool
ehCrescente [] = True
ehCrescente [x] = True
ehCrescente (x:y:xs) = if x <= y then ehCrescente(y:xs) else False
