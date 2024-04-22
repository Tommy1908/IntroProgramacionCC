--Ejercicio 1. Definir las siguientes funciones sobre listas:

--1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.

longitud :: [t] -> Int
longitud [] = 0
longitud a = 1 + longitud(tail a)

--2. ultimo :: [t] -> t segun la siguiente especificacion:
{-problema ultimo (s: seq⟨T ⟩) : T {
    requiere: { |s| > 0 } y Asegura: { resultado = s[|s| − 1] }
}-}

ultimo :: [t] -> t --No listas vacias
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs

--3. principio :: [t] -> [t] segun la siguiente especificacion:
{-problema principio (s: seq⟨T ⟩) : seq⟨T ⟩ {
    Requiere: { |s| > 0 }  y asegura: { resultado = subseq(s, 0, |s| − 1) }
}-}

principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 2 = x:[]
                 | otherwise = x: principio xs
-- [1,2,3] -> 1:2:3:[] = 1:2:[3] = 1:[2,3] = [1,2,3] 

--4. reverso :: [t] -> [t] segun la siguiente especificacion:
{-problema reverso (s: seq⟨T ⟩) : seq⟨T ⟩ {
    requiere: { True } y Asegura: { resultado tiene los mismos elementos que s pero en orden inverso.}
}-}

--reverso :: [t] -> [t]
--reverso (x,xs)| longitud(x,xs) == 1 = x:[]
--              | otherwise = x: reverso xs

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs



hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | longitud (x:xs) <= 1 = False
                    | pertenece x xs = True
                    | otherwise = hayRepetidos xs


--SACA SOLO 1 VEZ
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x:quitar n xs

----------------------------------------------------
maximo :: [Int] -> Int  -- No lista vacia
maximo (x:xs) | xs == [] = x
              | otherwise = esMaximo x (maximo xs)

esMaximo :: Int -> Int -> Int
esMaximo x y | x >= y = x
             | otherwise = y

--maximoProfe :: Int -> Int -> Int
--maximoProfe [x] = x
--maximoProfe(x,y,xs)| x>y = maximo(x:xs)
--                   | otherwise = maximo(y:xs) 
----------------------------------------------------
--Seria mejor usar quitar todos pero no lo tengo ahora, asi que desp lo cambiamos
ordenar :: [Int] -> [Int] --De menor a mayor ERA! ESTA MAL
ordenar [] = []
ordenar (x:xs) = 
    --ordenar (quitar maximo(x:xs) (x:xs)) ++ maximo(x:xs)
    --maximo(x:xs) : ordenar(quitar (maximo(x:xs)) (x:xs))
 
