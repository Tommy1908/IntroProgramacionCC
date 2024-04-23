--Ejercicio 3. Definir las siguientes funciones sobre listas de enteros--

sumatoria :: [Int] -> Int --Suma cada elemento de la lista | No hace falta poner longitud, ya que cumple con lo pedido igual
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int --Multiplica cada elemento de la lista
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Int] -> Int --No lista vacia
maximo [x] = x
maximo (x:xs) | x > maximo xs = x
              | otherwise = maximo xs


----------------------------------------------------
--Seria mejor usar quitar todos pero no lo tengo ahora, asi que desp lo cambiamos
--ordenar :: [Int] -> [Int] --De menor a mayor ERA! ESTA MAL
--ordenar [] = []
--ordenar (x:xs) = 
    --ordenar (quitar maximo(x:xs) (x:xs)) ++ maximo(x:xs)
    --maximo(x:xs) : ordenar(quitar (maximo(x:xs)) (x:xs))
 
