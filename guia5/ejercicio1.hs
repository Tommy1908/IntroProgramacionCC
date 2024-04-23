--Ejercicio 1. Definir las siguientes funciones sobre listas:

--1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.

longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--2. ultimo :: [t] -> t // Ultimo elemento

ultimo :: [t] -> t --No listas vacias
ultimo (x:xs) | longitud (x:xs) == 1 = x
              | otherwise = ultimo xs

--3. principio :: [t] -> [t]  // Todos menos el ultimo

principio :: [t] -> [t]
principio (x:xs) | longitud (x:xs) == 2 = x:[]
                 | otherwise = x: principio xs
-- [1,2,3] -> 1:2:3:[] = 1:2:[3] = 1:[2,3] = [1,2,3] 

--4. reverso :: [t] -> [t]  // resultado tiene los mismos elementos que s pero en orden inverso

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs)| longitud(x:xs) == 1 = x:[]
              | otherwise = (reverso xs) ++ (x:[])

-- [4] ++ [3] ++ [2] ++ [1]