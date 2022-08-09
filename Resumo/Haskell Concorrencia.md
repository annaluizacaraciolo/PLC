# Haskell Concorrência

### Como começar com concorrência em Haskell

Anteriormente usamos apenas o ambiente interativo de Haskell. Agora, vamos passar a compilar nossos programas. Por que isso acontece?  Idk

Passo a passo para compilarmos um programa genérico:

1. Navegar até o diretório do arquivo que queremos compilar
2. Digitar no terminal: **ghc —make ./filename.hs**
3. Ao finalizar a etapa de linking, podemos chamar no terminal **“.\” + filename** (Se a compilação for concluída com sucesso, devemos ter agora 3 arquivos: um .exe, um .hi e um .o)

Para compilarmos nossos programas concorrentes vamos seguir um passo a passo um pouco diferente:

1. Navegar até o diretório do arquivo que queremos compilar
2. Digitar no terminal: **ghc -threaded filename.hs**
3. Ao finalizar a etapa de linking, podemos chamar no terminal: **.\filename +RTS -N2**

Agora que passamos a compilar nosso programa, temos a opção de usar os chamados “Modes of operation” em Haskell. Um dos exemplos que usamos acima foi o `--make` . Essa flag é a opção default para compilarmos um arquivo .hs genérico. Muitas outras opções são oferecidas em Haskell. Podemos usar tanto o comando `ghc --make filename.hs` quando `ghc filename.hs`  quando temos um arquivo .hs no nosso diretório. A flag `-N` (como usamos acima no passo 3) serve para especificarmos que queremos usar mais de um núcleo de processamento. 

### Pacote Control.Concurrent

Vimos que podemos rodar um programa concorrente em haskell usando a opção 

-threaded, que possibilita a definição do número de threads que queremos usar (-N <x>). 

Programas concorrentes em Haskell não precisam obrigatoriamente ser compilados com o runtime -threaded; Esta opção apenas nos permite usar o -N para definirmos que queremos que essas threads trabalhem em paralelo, em mais de um núcleo. 

Para criarmos threads, podemos usar o `forkIO` ou `forkOS` . Vamos usar o `forkIO` . E qual seria a diferença entre as duas? Um forkIO cria uma thread no runtime de Haskell, que é mais leve e pode ser controlada por qual thread do OS. Já o forkOS cria uma thread associada a uma thread do OS.

### Control.Concurrent.MVar

MVars são “variáveis” que podem estar armazenando um valor ou não. 

| newEmptyMVar :: IO (Mvar a ) | cria uma MVar sem valor |
| --- | --- |
| newMVar :: a → IO (MVar a) | cria uma MVar com um valor |
| takeMVar :: MVar a → IO a | pega o valor de uma MVar e  a deixa vazia |
| putMVar :: MVar a → a → IO ( ) | escreve um valor numa MVar |
| readMVar :: MVar a → IO a | “read only” |

### Control.Concurrent.STM.TVar

> O que é STM? *software transactional memory* é uma abstração do gerenciamento de threads.
> 

Por que STM? O uso de STM é vantajoso por prover uma solução para alguns dos principais problemas frequentemente encontrados ao usar threads. Isso é feito ao criar blocos que serão executados como uma transação, ou seja, de forma atômica. 

TVar - é o principal tipo associado ao pacote STM. Esse tipo implementa operações atômicas.

Algumas das funções suportadas são

| atomically :: STM a → IO a |  |
| --- | --- |
| readTVar :: TVar a → STM a |  |
| writeTVar :: TVar a → a → STM( ) |  |

*Atenção: atentar-se ao retorno da função, se será um IO action ou STM action.

**Mais atenção: a criação de uma TVar, diferentemente de uma MVar, precisa receber um valor de argumento. 

### IO & STM monads