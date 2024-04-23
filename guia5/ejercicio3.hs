--Ejercicio 3. Definir las siguientes funciones sobre listas de enteros--

--1)
sumatoria :: [Int] -> Int --Suma cada elemento de la lista | No hace falta poner longitud, ya que cumple con lo pedido igual
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--2)
productoria :: [Int] -> Int --Multiplica cada elemento de la lista
productoria [] = 1
productoria (x:xs) = x * productoria xs

--3)
maximo :: [Int] -> Int --No lista vacia, va corriendo y dejando primero al mayor
maximo [x] = x
maximo (x:y:xs) | x < y = maximo (y:xs)
                |otherwise = maximo(x:xs)

--4)
sumarN :: Int -> [Int] -> [Int] 
sumarN n [] = []
sumarN n (x:xs) = (x+n) : sumarN n xs

--5)
sumarElPrimero :: [Int] -> [Int] --No lista vacia
sumarElPrimero (x:xs) = sumarN x (x:xs)

--6)
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

--7)
pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x: (pares xs)
             | otherwise = pares xs

--8)
multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | ((mod x n) == 0) = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

--9)
ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar [x] = x:[]
ordenar l = minimo l : (ordenar (quitar (minimo l) l))

minimo :: [Int] -> Int --No lista vacia, va corriendo y dejando primero al mayor
minimo [x] = x
minimo (x:y:xs) | x > y = minimo (y:xs)
                | otherwise = minimo(x:xs)

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x:quitar n xs