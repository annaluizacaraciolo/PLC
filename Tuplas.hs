-- questão 1
menorMaior :: Integer -> Integer -> Integer -> (Integer, Integer)
menorMaior x y z = (min (min x y) z, max (max x y) z)

-- questão 2
--ordenaTripla :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)

-- questão 3
type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

fstCoord :: Ponto -> Float 
fstCoord (a,b) = a

scdCoord :: Ponto -> Float
scdCoord (a,b) = b

-- questão 4