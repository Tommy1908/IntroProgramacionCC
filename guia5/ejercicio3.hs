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
--ordenar :: [Int] -> [Int] --De menor a mayor ERA! ESTA MAL
--ordenar [] = []
--ordenar (x:xs) = 
    --ordenar (quitar maximo(x:xs) (x:xs)) ++ maximo(x:xs)
    --maximo(x:xs) : ordenar(quitar (maximo(x:xs)) (x:xs))
 
