--Ejercicio 1
--[1] dada una lista devuelve su cantidad de elementos
longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

--[2] devuelve el ultimo
ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs

primero :: [t] -> t
primero (x:xs) = x

--[3] "tails" pero del principio
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

--[4] resultado tiene los mismos elementos que s pero en orden inverso
reverso :: [t] -> [t]
reverso [x] = [x]
reverso l = ultimo l : reverso (principio l)


--Ejericicio 2

--[1] resultado = true ↔ e ∈ s 
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece t [s] = t == s
pertenece t (x:xs)
    | x == t = True
    | otherwise = pertenece t xs

--[2]
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales [x,y] = x == y
todosIguales (x:xs) = x == primero xs && todosIguales xs

--[3]
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [x] = True
todosDistintos [x,y] = x /= y
todosDistintos (x:xs) = x /= primero xs && todosDistintos xs

--[4] true ↔ existen dos posiciones distintas de s con igual valor 
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (x:xs)
    | xs == [] = False
    | pertenece x xs = True
    | otherwise = hayRepetidos xs

--[5]
quitar :: (Eq t) => t -> [t] -> [t]
quitar t [] = []
quitar t (x:xs)
    | pertenece t (x:xs) == False = (x:xs)
    | t == x = xs
    | otherwise = x : quitar t xs

--[6]
quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos t [s]
    | t == s = []
    | otherwise = [s]
quitarTodos t (x:xs) 
    | t == x = quitarTodos t xs
    | otherwise = x : quitarTodos t xs

--[7]
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [l] = [l]
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

--[8] A c B y B c A
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
-- mismosElementos lista1 lista2 = lista1 esta incluida en lista2 y lista2 esta incluida en lista1
mismosElementos lista1 lista2 = incluida lista1 lista2 && incluida lista2 lista1
    where
        incluida :: (Eq t) => [t] -> [t] -> Bool
        incluida [a] listaB = pertenece a listaB
        incluida (a:as) (b:bs) = pertenece a (b:bs) && incluida as (b:bs)
--[9]
capicua :: (Eq t) => [t] -> Bool
capicua l = l == reverso l


--Ejercicio 3

--[1]
sumatoria :: [Integer] -> Integer
sumatoria [i] = i
sumatoria (x:xs) = x + sumatoria xs

--[2]
productoria :: [Integer] -> Integer
productoria [i] = i
productoria (x:xs) = x * productoria xs

--[3]
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs)
    | x > maximo xs = x 
    | otherwise = maximo xs

--[4]
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [s] = [n + s]
sumarN n (x:xs) = n + x : sumarN n xs

--[5]
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

--[6]
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo l = sumarN (ultimo l) l

--[7]
pares :: [Integer] -> [Integer]
pares lista = multiplosDeN 2 lista
-- pares :: [Integer] -> [Integer]
-- pares [s]
--     | mod s 2 == 0 = [s]
--     | otherwise = []
-- pares (x:xs)
--     | mod x 2 == 0 = x : pares xs
--     | otherwise = pares xs

--[8]
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [s]
    | mod s n == 0 = [s]
    | otherwise = []
multiplosDeN n (x:xs)
    | mod x n == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs

--[9]
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar l = minimo l : ordenar (quitar (minimo l) l)

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs)
    | x < minimo xs = x 
    | otherwise = minimo xs

--Ejercicio 4