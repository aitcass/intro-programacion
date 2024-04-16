--Ejercicio factorial
factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n - 1)
    
--Ejercicio 1

fibonacci :: Integer -> Integer
fibonacci n 
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci(n - 1) + fibonacci(n - 2)

--Ejercicio 2
parteEntera :: Float -> Integer
parteEntera x 
    | x >= 0 = truncar x 0
    | x < 0 = truncar (-x) 0
    where
        truncar :: Float -> Integer -> Integer
        truncar y n 
            | fromIntegral n > n = n - 1
            | otherwise = truncar y (n + 1)

parteEntera2 :: Float -> Integer
parteEntera2 x = truncate x 

--ejercicio 3
esDibisible :: Integer -> Integer -> Bool
esDibisible n1 n2
    | n1 == 0 = True 
    | n1 < 0 = False
    | otherwise = esDibisible (n1 - n2) n2

--Ejercicio 4
sumaImpares :: Integer -> Integer
sumaImpares n = contar 1 n
    where
        contar :: Integer -> Integer -> Integer
        contar uno hasta
            | hasta == 0 = 0
            | otherwise = uno + contar (uno + 2) (hasta - 1)

--Ejercicio 5
medioFact :: Integer -> Integer
medioFact n
    | n == 0 = 1
    | n == 1 = 1
    | otherwise = n * medioFact (n - 2) 

--Ejercicio 6
sumaDigitos :: Integer ->Integer
sumaDigitos n
    | div n 10 <= 0 = 1
    | otherwise = mod n 10 + sumaDigitos (div n 10)

--Ejercicio 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n < 10 = True
    | mod n 10 == div (mod n 100) 10 = todosDigitosIguales (div n 100)
    | otherwise = False

-- todosDigitosIguales :: Integer -> Bool
-- todosDigitosIguales n 
--     | abs(n) < 10 == True
--     | (ultimoDigito n == anteultimoDigito n) = todosDigitosIguales (div n 10)
--     | otherwise = False

-- ultimoDigito :: Integer -> Integer
-- ultimoDigito x = mod x 10

-- anteultimoDigito :: Integer -> Integer
-- anteultimoDigito y = mod (div y 10) 10

--Ejercicio 8
iesimoDigito :: Integer ->Integer ->Integer
iesimoDigito n i = mod (div n (10 ^ ((cantDigitos n) - i))) 10 

cantDigitos :: Integer ->Integer
cantDigitos n
    | div n 10 <= 0 = 1
    | otherwise = 1 + cantDigitos (div n 10)
        

--Ejercicio 9
--n es capicua si:
    --n tiene un dijito
        -- n < 10
    --n1 n2 ... nn == nn ... n2 n1
        --n1 == nn && n2 == nn-1 && n3 == nn-2 && ...

esCapicua :: Integer -> Bool
esCapicua n
    | n < 10 = True
    | div n (10 ^ ((cantDigitos n) - 1)) == mod n 10 = esCapicua (div (mod n (10 ^ ((cantDigitos n) - 1))) 10)
    --si el primer dijito = ultimo dijito => sacar primer y ultimo dijito y hacer lo mimsmo
    --en sc: primerDijito n == ultimoDijito n = esCapicua (sacarPrimerUltimoDijito n)
    | otherwise = False

--Ejercicio 10
f10a :: Integer -> Integer --2^(n+1)-1
f10a 0 = 1
f10a n = (2 ^ n) + f10a (n - 1)