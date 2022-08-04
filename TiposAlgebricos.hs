-- árvore
data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show, Eq, Ord)

insert :: Ord a => Tree a -> a -> Tree a
insert Leaf a = Node a Leaf Leaf
insert (Node x left right) a
    |x == a = Node a left right
	|x < a = (Node x (insert left a) right)
	|x > a = (Node x left (insert right a))

root :: Tree a -> Maybe a
root Leaf = Nothing
root (Node x left right) = Just x

height :: Tree a -> Int
height Leaf = 0
height (Node a left right) = 1 + max (height left) (height right)

arvLista :: Tree a -> [a]
arvLista (Node x Leaf Leaf) = [x]
arvLista (Node x left Leaf) = [x] ++ arvLista left 
arvLista (Node x Leaf right) = [x] ++ arvLista right
arvLista (Node x left right) = [x] ++ arvLista left ++ arvLista right

--listaArv :: [a] -> Tree a

-- LISTA DE EXERCÍCIOS DE TIPOS ALGÉBRICOS
-- questão 1
safeDiv :: Float -> Float -> Maybe Float
safeDiv x 0 = Nothing
safeDiv x y = Just (x/y)

-- questão 2
safeDiv' :: Float -> Float -> Either String Float
safeDiv' x 0 = Left (show x ++ "/0")
safeDiv' x y = Right resultado
	where resultado = x/y

-- questão 3
--mapMaybe :: [a] -> (a -> Maybe b) -> [Maybe a]

-- questão 4
--classifica :: [x] -> Either [a] [b]
--classifica _ = Left ([x])
