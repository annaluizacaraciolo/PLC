-- questão 1
menorMaior :: Integer -> Integer -> Integer -> (Integer, Integer)
menorMaior x y z = (min (min x y) z, max (max x y) z)

minThree :: Integer -> Integer -> Integer -> Integer
minThree a b c = min a (min b c)

maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c = max a (max b c)

sumDif :: Integer -> Integer -> Integer -> Integer
sumDif a b c = (a + b + c) - (maxThree a b c) - (minThree a b c)

-- questão 2
ordenaTripla :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
ordenaTripla (x,y,z) = (minThree x y z, sumDif x y z, maxThree x y z)

-- questão 3
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

fstCoord :: Ponto -> Float 
fstCoord (a,b) = a

scdCoord :: Ponto -> Float
scdCoord (a,b) = b

vertical :: Reta -> Bool
vertical ((x1,y1), (x2, y2)) = if (x1 == x2) then True else False

-- questão 4
pontoY :: Float -> Reta -> Float
pontoY x3 ((x1,y1), (x2,y2)) = ((y2-y1)/(x2-x1)*(x3-x1)) + y1