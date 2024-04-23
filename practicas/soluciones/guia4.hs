--Ejercicio factorial
factorial :: Integer -> Integer
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

f10b :: Integer -> Float -> Float
f10b 1 q = q
f10b n q = (q ^ n) + f10b (n - 1) q

f10c :: Integer -> Float -> Float
f10c 1 q = q + (q ^ 2)
f10c n q = f10b (2 * n) q

f10d :: Integer -> Float -> Float
f10d n q = (f10c n q) - (f10b (n - 1) q)

--Ejercicio 11
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = 1 / fromIntegral (factorial n) + eAprox (n - 1)

e :: Float
e = eAprox 10

--Ejercicio 12
raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = 1
raizDe2Aprox n = an n - 1
    where
        an :: Integer -> Float
        an 1 = 2 
        an ene = 2 + (1 / (an (ene - 1)))

--Ejericio 13
-- sumatoria de i a n de sumatoria j m de i ^ j
f13 :: Integer -> Integer -> Integer
f13 1 1 = 1
f13 1 m = truncate (f10b m 1.0)
f13 n 1 = n * n
f13 n m = suma n m + suma (n - 1) m
    where
        suma :: Integer -> Integer -> Integer
        suma n 1 = n
        suma n m = n ^ m + suma n (m - 1)

--Ejercicio 14
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = truncate (f10b n (fromIntegral q) * f10b m (fromIntegral q))

--Ejercicio 15
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales p q | p == 1 = sumaRacAux 1 q
                   | otherwise = sumaRacAux p q + sumaRacionales (p-1) q 
    where
        sumaRacAux :: Integer -> Integer -> Float
        sumaRacAux p q | q == 1 = fromIntegral p 
                       | otherwise = (fromIntegral p) / (fromIntegral q) + sumaRacAux p (q-1)

{- sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 1 = 1.0
sumaRacionales p q = sumat p q + sumat (p - 1) q
    where
        sumat :: Integer -> Integer -> Float
        sumat p 1 = fromIntegral p
        sumat p q = (fromIntegral p) / (fromIntegral q) + sumat p (q - 1)
-}
--Ejercicio 16
menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorDesde n 2
    where
        menorDivisorDesde :: Integer -> Integer -> Integer
        menorDivisorDesde n k
            | mod n k == 0 = k
            | otherwise = menorDivisorDesde n (k + 1)

esPrimo :: Integer -> Bool
esPrimo 1 = True
esPrimo n = menorDivisor n == n

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos x y = coprimosAux x y 2
    where
        coprimosAux :: Integer -> Integer -> Integer -> Bool
        coprimosAux x y divisor
            | divisor > x || divisor > y = True
            | (esDibisible x divisor) && (esDibisible y divisor) = False
            | otherwise = coprimosAux x y (divisor + 1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = nEsimoPrimoAux (nEsimoPrimo (n - 1))
    where
        nEsimoPrimoAux :: Integer -> Integer
        nEsimoPrimoAux n
            | esPrimo (n + 1) = n + 1
            | otherwise = nEsimoPrimoAux (n + 1)

--Ejercicio 17
esFibonacci :: Integer -> Bool
esFibonacci n = esfiboacciAux n 0
    where
        esfiboacciAux :: Integer -> Integer -> Bool
        esfiboacciAux n cont
            | fibonacci cont == n = True
            | fibonacci cont > n = False
            | fibonacci cont < n = esfiboacciAux n (cont + 1)

--Ejercicio 18
mayorDijitoPar :: Integer -> Integer
mayorDijitoPar n
    | n < 10 && mod n 2 /= 0 = -1
    | n < 10 && mod n 2 == 0 = n
    | ultimoDigito n >= mayorDijitoPar (sacarUltimo n) && esPar (ultimoDigito n) = ultimoDigito n
    | ultimoDigito n < mayorDijitoPar (sacarUltimo n) = mayorDijitoPar (sacarUltimo n)
    | otherwise = mayorDijitoPar (sacarUltimo n)

ultimoDigito :: Integer -> Integer
ultimoDigito n = mod n 10
sacarUltimo :: Integer -> Integer
sacarUltimo n = div n 10
esPar :: Integer -> Bool
esPar n = mod n 2 == 0

--Ejercicio 19
esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaInicialDePrimosAux n 1
    where 
        esSumaInicialDePrimosAux :: Integer -> Integer -> Bool
        esSumaInicialDePrimosAux n aux
            | sumaPrimos aux > n = False
            | sumaPrimos aux < n = esSumaInicialDePrimosAux n (aux + 1)
            | otherwise = True

sumaPrimos :: Integer -> Integer
sumaPrimos 1 = 2
sumaPrimos n = nEsimoPrimo n + sumaPrimos (n - 1)

--Ejercicio 20 revisar
tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n m | (n == m) = sumaDivisores(n)
                 | otherwise = max (sumaDivisores (n)) (tomaValorMax (n+1) m)

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresDesde n 1

sumaDivisoresDesde :: Integer -> Integer -> Integer
sumaDivisoresDesde n k | (k == n) = n 
                       | (k < n) && (mod n k == 0) = k + sumaDivisoresDesde n (k+1)
                       | (k > n) = 0
                       | otherwise = sumaDivisoresDesde n (k+1)

--Ejercicio 21 revisar
pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras 0 n r = cantidadXmenorY n (r^2)   
pitagoras m 0 r = cantidadXmenorY m (r^2) 
pitagoras m n r = pitagoras (m-1) n r + cantidadXmenorY n (r^2 - m^2)

cantidadXmenorY :: Integer -> Integer -> Integer
cantidadXmenorY x y = cantidadXmenorYDesde x y 0

cantidadXmenorYDesde :: Integer -> Integer -> Integer -> Integer
cantidadXmenorYDesde x y k | (k < x) && (k^2 <= y) = 1 + cantidadXmenorYDesde x y (k+1)
                           | (k < x) = cantidadXmenorYDesde x y (k+1)
                           | (k == x) && (k^2 <= y) = 1
                           | (k == x) = 0 