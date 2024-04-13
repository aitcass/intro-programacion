--ejercicio 1
fibonacci :: Integer -> Integer 
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

--ejercicio 2
parteEntera :: Float -> Integer
--parteEntera x = x - (x - parteEntera x)
--opcion2 parteEntera x = sumar n desde 0  de 1 en 1
-- hasta que n > x y restarle 1. entonces n <= x < n + 1

parteEntera x | x >= 0 = truncar x 0
              | x < 0 = truncar (-x) 0
    where
        truncar :: Float -> Integer -> Integer
        truncar y n | fromIntegral n > y = n -1
                    | otherwise = truncar y (n + 1)              
-- ¿todo esto solo para tener la variable n, no se puede hacer una variable n = 0?

--ejercicio 3
esDivisible :: Integer -> Integer -> Bool
--x es divisible por y  si existe un k entero : x = k * y
esDivisible x y | x == 0 = True
                | x < 0 = False
                | otherwise = esDivisible (x - y) y