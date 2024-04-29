module Simulacro where
    
relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas [(a,b)]
    | a /= b = True
    | otherwise = False
relacionesValidas ((a,b):xs)
    | a == b = False
    | pertenece (a,b) xs = False
    | pertenece (b,a) xs = False
    | otherwise = relacionesValidas (xs)

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False 
pertenece a (x:xs)
    | a == x = True
    | otherwise = pertenece a xs



personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas [(x,y)] = [x,y]
personas ((a,b):xs)
    | noAparece a xs && noAparece b xs = a : b : personas xs
    | noAparece a xs = a : personas xs
    | noAparece b xs = b : personas xs
    | otherwise = personas xs

noAparece :: String -> [(String, String)] -> Bool
noAparece s [(a,b)] = s /= a && s /= b
noAparece s ((a,b):xs)
    | s /= a && s /= b = noAparece s xs
    | otherwise = False



amigosDe :: String -> [(String, String)] -> [String]
amigosDe "nadie" [] = ["nadie"]
amigosDe _ [] = []
amigosDe p ((a,b):xs)
    | p == a = b : amigosDe p xs
    | p == b = a : amigosDe p xs
    | otherwise = amigosDe p xs



personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo" 
personaConMasAmigos relaciones = personaConMasAmigosAux (personas relaciones) relaciones

personaConMasAmigosAux :: [String] -> [(String, String)] -> String 
personaConMasAmigosAux [p] _ = p
personaConMasAmigosAux (x:y:xs) relaciones
    | cantAmigos x relaciones >= cantAmigos y relaciones = personaConMasAmigosAux (x:xs) relaciones
    | otherwise = personaConMasAmigosAux (y:xs) relaciones

cantAmigos :: String -> [(String, String)] -> Int
cantAmigos s lista = longitud (amigosDe s lista)

longitud :: [t] -> Int
longitud [] = 0
longitud (_:xs) = 1 + longitud xs