--Ejercicio 1
--[1] dada una lista devuelve su cantidad de elementos
longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

--[2] devuelve el ultimo
ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs

--[3] "tails" pero del principio
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

--[4] resultado tiene los mismos elementos que s pero en orden inverso
reverso :: [t] -> [t]
reverso [x] = [x]
reverso l = ultimo l : reverso (principio l)

--Ejercicios clase practica 5 22/04 [2.1, 2.4, 2.5, 3.3, 3.9]
--Ejericicio 2
--[1] resultado = true ↔ e ∈ s 
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece t [s] = t == s
pertenece t (x:xs)
    | x == t = True
    | otherwise = pertenece t xs

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

--Ejercicio 3
--[3]
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs)
    | x > maximo xs = x 
    | otherwise = maximo xs

--[9]
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar l = minimo l : ordenar (quitar (minimo l) l)
    where
        minimo :: [Integer] -> Integer
        minimo [x] = x
        minimo (x:xs)
            | x < minimo xs = x 
            | otherwise = minimo xs