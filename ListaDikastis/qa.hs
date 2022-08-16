potencia :: Integer -> Integer -> Integer
potencia _ 0 = 1
potencia n 1 = n
potencia n k = n * potencia n (k-1) -- esses parênteses são importantes

parseInput str = let [n,k] = map read (words str) in (n,k)

main :: IO()
main = do
    interact $ show . uncurry potencia . parseInput