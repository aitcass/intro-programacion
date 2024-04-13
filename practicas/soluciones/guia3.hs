--ejercicio 3
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = mod a b == 0 

--ejercicio 5
f :: Integer -> Integer
f n | n <= 7 = n ^ 2
    | otherwise = 2 * n - 1

g :: Integer -> Integer
g n | mod n 2 == 0 = div n 2
    | otherwise = 3 * n + 1

todosMenores  :: (Integer, Integer, Integer) ->Bool
todosMenores (a, b, c) = f(a) > g(a) && f(b) > g(b) && f(c) > g(c)

--ejercicio 6
bisiesto :: Integer ->Bool
bisiesto a | mod a 4 == 0 = True
           | mod a 100 == 0 && mod a 400 /= 0 = True
           | otherwise = False

--ejercicio 7
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
distanciaManhattan (a, b ,c) (d, e, f) = abs(a - d) + abs(b - e) + abs(c - f)

--ejercicio 8
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = (mod (abs x) 10) + (mod (abs (div x 10)) 10)

comparar :: Integer ->Integer ->Integer
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
             | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0   

--ejercicio 9

