-- Lista de exercícios de Typeclasses
import Data.List 

-- questão 1

-- questão 2
data Vetor = Vetor Integer Integer Integer deriving (Show) -- não podemos adicionar o Eq no deriving se 
                                                            -- vamos criar sua instancia

instance Eq Vetor where
    (==) (Vetor x y z) (Vetor a b c) = ( x==a && y==b && z==c)

-- questão 3


-- questão 4
--freqs :: [a] -> [(Int,a)]


-- questão 5
data ITree = ILeaf | INode Int ITree ITree deriving (Show)

instance Eq ITree where 
    (==) (INode x leftx rightx) (INode y lefty righty) = ( x == y && (leftx == lefty) && (rightx == righty))
