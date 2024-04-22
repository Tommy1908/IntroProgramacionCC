
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
 
