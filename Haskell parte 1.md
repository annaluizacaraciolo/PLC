# Haskell parte 1

# Como começar com Haskell

1. Instalar o GHC ✅

Para rodarmos nossos códigos precisamos

1. criar o arquivo e navegar até seu diretório
2. Chamar `ghci` no terminal
3. Inserir no terminal `:l nomedoarquivo.hs` 
- Se fizemos uma alteração depois de termos carregado o arquivo, basta dar o comando `:r` no terminal que o arquivo será recarregado.

Alguns outros comandos do GHCI que podem vir a ser úteis estão listados a seguir:

- `:r` Recarrega o último comando do terminal
- `:?` ou `:help` ajuda do ghci
- `:type` retorna o tipo de uma função ou variável
- `:info` carrega algumas informações de uma typeclass  (usaremos mais adiante)

Vale lembrar que o GHC é o compilador de Haskell (Glasgow Haskell Compiler). O ghci é um ambiente interativo para Haskell. Com o ghci conseguimos interpretar os códigos da primeira parte da disciplina. Entretanto, ao abordarmos concorrência em Haskell passaremos a compilar nossos códigos. 

# Tipos primitivos

Primeiro, é importante saber que:

1. Haskell é statically typed, ou seja, o compilador identifica os tipos na compilação, evitando alguns erros no futuro.
2. Haskell consegue inferir tipos; Vamos ver que podemos escrever algumas funções declarando o tipo que recebe e o que retorna, assim como poderíamos não fazer isso.

Alguns dos tipos existentes são `Char` `Int` `Num` `Integer` `Bool` `()` 

Também podemos ter uma **type variable**, que é uma variável genérica que pode representar qualquer (e mais de um!) tipo. Vamos ver um exemplo:

```haskell
takeFirst :: [a] -> Maybe a
takeFirst [] = Nothing
takeFirst (x:xs) = Just x

>>> :t takeFirst
takeFirst :: [a] -> Maybe a
```

O tipo retornado pela função takeFirst é um Maybe a. Vamos focar apenas no ‘a’ por enquanto: esse ‘a’ é uma type variable. 

# Listas e tuplas

### Como declarar listas em haskell?

Vimos no exemplo acima que podemos usar listas entre brackets [] ou no formato (x:xs). O formato (x:xs) significa, a grosso modo, o elemento atual da lista (x) e o resto da lista(xs). Também é possível usar a notação (x:y:xs), que será útil em alguns casos. 

### Algumas funções nativas sobre listas

- `head`
    
    ```haskell
    head [2,5,1,6]
    >>> 2
    ```
    
- `tail`

```haskell
tail [2,5,1,6]
>>> [5,1,6]
-- retorna tudo menos o primeiro elemento
```

Para retornar somente o último elemento usamos a função `last` 

- `length`
- `reverse`
- `maximum`
- `drop` remove os primeiros n elementos de uma lista
    
    ```haskell
    drop 3 [8,4,2,1,5]
    >>> [1,5]
    ```
    
- `take` pega os primeiros n elementos de uma lista

### Padrões de computação sobre listas

- Fold -
- Map - O seu formato é “map (função/operação) [lista]”
    
    ```haskell
    doubleList :: (Num a) => [a] -> [a]
    doubleList x = map (*2) x
    ```
    
- Filter - O seu formato é
    
    **Recebe**: um predicado (uma expressão que pode ser avaliada entre True | False) e uma lista
    
    **Retorna**: uma lista contendo os valores que satisfizeram o predicado.
    

As sintaxes `:`  e `++` 

A assinatura da função `:` em Haskell é a → [a] → [a]

Já a assinatura de `++` é [a] → [a] → [a] 

Esses dois são diferentes por que, apesar de ambos retornarem listas, a função : recebe um valor (a) e uma lista, já a função ++ recebe duas listas como argumento.

### Tuplas

Diferenças em relação a listas:

1. O tipo de uma tupla depende do tipo que ela contém e sua quantidade de elementos. O tipo de uma lista é lista, independente se tem zero elementos, 1 ou ‘infinitos’.
2. Tuplas podem conter valores de tipos diferentes;

# Typeclasses

Typeclasses funcionam como interfaces que ditam o comportamento de tipos. Vamos ver exemplos e descrição de algumas typeclasses:

- Enum - Types in this class: **()**, **Bool**, **Char**, **Ordering**, **Int**
, **Integer**, **Float** and **Double.**
- Num - tipos numéricos
- Ord - ordenáveis.
- Show - possibilita a escrita no terminal (ser apresentada como string).
- Eq - suporta as operações == e /=
- Read -

Precisamos nos atentar a duas coisas ao aprendermos sobre typeclasses:

1. o operador `=>` se chama type constraint e seu nome descreve sua função. Vamos usar esse operador quando queremos especificar na declaração de uma função que alguma ou algumas de suas variáveis precisa ter seu tipo contido em uma typeclass. Vamos ilustrar com um exemplo:
    
     
    
    ```haskell
    myfunc :: (Ord a) => [a] -> [a]
    ```
    
    Na função myfunc, precisamos dar como argumento uma lista de valores de algum tipo, desde que esse tipo tenha a propriedade de ser ordenável (Implementado pela typeclass Ord). 
    
2. No tópico de ‘tipos algébricos’ iremos criar nossas próprias instâncias de typeclasses, por isso é bom sabermos o comportamento da lista de typeclasses dada acima. **Para ver a implementação dessas typeclasses podemos entrar no ghci e usar o comando `:info` com a typeclasss que queremos (veremos em exemplos daqui a pouco).**

**Tipos Maybe e Either e exception handling**

[https://blog.thomasheartman.com/posts/haskells-maybe-and-either-types](https://blog.thomasheartman.com/posts/haskells-maybe-and-either-types) 

# Higher order

Funções em Haskell aceitam apenas um argumento de entrada e um resultado. Isso, significa que uma função que aparentemente possui mais de um argumento, na verdade, é a aplicação sucessiva da função sobre um argumento de cada vez. 

### Composição de função

O operador de composição de funções é o ponto `.` 

### Curried functions

### Revisitando padrões de computação sobre listas

- `foldr` - a **avaliação** é feita à direita;
- `foldl` - a **avaliação** é feita à esquerda;

No que isso implica? Primeiramente, que foldl é lazy então pode ser usada para avaliar listas infinitas. O mesmo não é verdade para foldr.

Qual é a assinatura dos métodos de fold?

foldl (-) x [xs]

O primeiro argumento em foldl é a operação que queremos aplicar sobre o x e o segundo argumento da lista; Em seguida, esse resultado é obtido e reaplicamos a função sobre o resultado e o próximo elemento da lista.

```haskell
-- Exemplo de uso de anonymous function com map 
somaQuadrado :: [Int] -> Int 
somaQuadrado (x:xs) = foldl (+) 0 (map (\y -> y^2) (x:xs))

-- função de quadrado anterior
quadrado :: [Int] -> [Int]
quadrado (x:xs) = map (\y -> y^2) (x:xs)
```

Vamos ver dois exemplos para entender melhor o que significa “avaliar a esquerda ou a direita”:

```haskell

```

- `map` - o padrão de computação sobre listas map aplica uma função sobre uma lista e retorna a nova lista de acordo com a função aplicada. Diferentemente do fold, map retorna uma lista

Vamos ver alguns exemplos do uso de map de forma simples e como uma função de segunda ordem

```haskell

```

- `filter`

### Funções lambdas (anonymous functions)

[https://www.cs.bham.ac.uk/~vxs/teaching/Haskell/handouts/lambda.pdf](https://www.cs.bham.ac.uk/~vxs/teaching/Haskell/handouts/lambda.pdf)

Como caiu em prova: uma função lambda geralmente é passada como argumento de uma função de alta ordem.

Vamos ver alguns exemplos:

```haskell
map (\(a,b) -> a + b) [(1,2), (3,5), (6,3), (2,6), (2,5)]
>>> [3,8]
```

A estrutura de uma função lambda é:

`\` + seus parâmetros + `->` + a operação que essa função realiza

*Praticar o uso de funções lambda combinadas a funções map e funções lambda na definição de uma função. 

# Tipos algébricos

Nesse tópicos vamos aprender a declarar novos tipos de dados.

Isso é feito através da palavra reservada `data`;

Atenção: lembrar da distinção entre `type` e `data` . Usamos o type quando vamos criar um **type synonym*,*** que é apenas um novo nome para um tipo já existente.

```haskell
type age = Int
```

Neste caso, “age” é apenas um Int

Já `data` especifica um construtor e novas implementações de typeclasses.

Vamos ver um exemplo:

```haskell
data Vetor = Int Int Int deriving (Show)
```

O operador ‘deriving’ é usado para especificar a quais typeclasses esse novo tipo pertence. Falamos no tópico de typeclasses que podemos instanciar os tipos algébricos

```haskell
instance Eq Vetor where
    (==) (Vetor p1 p2 p3) (Vetor p4 p5 p6) = (p1 == p4 && p2 == p5 && p3 == p6)

```

Para sabermos como devemos implementar uma instancia, podemos ir no ghci e digitar `:info Eq`. 

![Untitled](Haskell%20parte%201%209167a97c87ec41bc981157877d4de50c/Untitled.png)

A parte mais importante do resultado é a definição minimal dada, onde é especificado quais operações devemos implementar na nossa instância. No caso de Eq, devemos implementar para a operação == ou  a /=.

Para a typeclass Num temos as seguintes operações: {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}

- (+) é a operação de adição
- (*) é a operação de multiplicação
- abs é a operação de módulo de um número
- signum
- fromInteger
- (negate | (-)) é a operação de obter o oposto de um número

O exemplo usado anteriormente foi o de Vetor. Agora veremos mais a fundo a implementação de uma estrutura de árvore;

```haskell
data Tree = Leaf | Node (Tree a) (Tree a) deriving (Show, Eq, Ord)
```

Algumas operações importantes sobre árvores são: inserir, remover, obter altura, obter raiz e converter em lista. Vamos implementar essas funções e mais algumas outras que podem ser úteis

```haskell
insert :: Tree a -> a -> Tree a
insert Leaf a = Node a (Leaf) (Leaf)
insert Node x (left) (right) a
	|x == a = Node a left right
	|x < a = Node x (insert a left) (right)
	|x > a = Node x left (insert a right)

--função de remover (NÃO TESTADA)
remove :: Tree a -> a -> Maybe (Tree a)
remove Leaf _ = Nothing
remove (Node n left right) x 
    | n == x = Just left
    | n > x = remove left x -- verificar o lado
    | otherwise = remove right x -- verificar o lado

-- função que retorna o valor da raiz
root :: Tree a -> Maybe a
root Leaf = Nothing
root (Node x left right) = Just x

-- função que retorna a altura
height :: Tree a -> Int
height Leaf = 0
height (Node a left right) = 1 + max (height left) (height right)

-- função que retorna a folha mais a esquerda
leftest :: Tree a -> Maybe a
leftest Leaf = Nothing
leftest (Node a left right) = Just leftest left

-- função para converter lista em árvore

-- função para converter árvore em lista 
```
