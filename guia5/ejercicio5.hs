--Ejercicio 5. Definir las siguientes funciones sobre listas

--1)

--Los elementos son > 0

l1 = [1,2,3,4,5] -- > [1,3,6,10,15]
l2 = [1.5,2.5,3.5]
l3 = [9,8,7,6,5]

sumaAcumulada :: (Num t) => [t] -> [t] 
sumaAcumulada [] = []
sumaAcumulada l = sumaAcumuladaAux ((longitud l )-1) 0 l

--                         long(l)-1  k, empieza en 0       long(l)-1 es para tener los indices
sumaAcumuladaAux ::(Num t) => Int -> Int -> [t] -> [t]
sumaAcumuladaAux _ _ [] = []
sumaAcumuladaAux i k (x:xs) | i == k = [sumar k (x:xs)]
                            | otherwise = [sumar k (x:xs)] ++ (sumaAcumuladaAux i (k+1) (x:xs))

--Suma hasta la pos 'k'
sumar ::(Num t) => Int -> [t] -> t
sumar _ [] = 0
sumar (-1) _ = 0
sumar k (x:xs) = x + (sumar (k-1) xs)


longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs



--2)
--Elementos de s > 2

descomponerEnPrimos :: [Int] -> [[Int]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [(descomponerEnPrimosAux x 1)] ++ (descomponerEnPrimos xs)

--                         x     k=1
descomponerEnPrimosAux :: Int -> Int -> [Int]
descomponerEnPrimosAux 1 _ = []
descomponerEnPrimosAux x k | (mod x (nEsimoPrimo k))== 0 = [nEsimoPrimo k] ++ (descomponerEnPrimosAux (div x (nEsimoPrimo k)) k)
                           | otherwise = descomponerEnPrimosAux x (k+1)

--Si el numero es divisible por el primo k, entonces ponemos a k en la lista, y volvemos a correr el programa con el numero divido k, y k devuelta por si pudera volver a dividirlo.
--En otro caso, si no puede dividirlo, probamos con el siguiente primo. Cuando eventualmente quede 1 en la division, terminamos.

---Funciones de primos del ej 16-guia 4---

--               >1
menorDivisor :: Int -> Int
menorDivisor x| mod x 2 == 0 = 2  --Todo numero par su menor divisor es 2
              | otherwise = encontrarDivisorDesde 2 x

--Devuelve i, cuando sea el menor divisor
encontrarDivisorDesde :: Int -> Int -> Int
encontrarDivisorDesde i x | mod x i == 0 = i
                          | otherwise = encontrarDivisorDesde (i+1) x

esPrimo :: Int -> Bool
esPrimo x = x == menorDivisor x

nEsimoPrimo :: Int -> Int
nEsimoPrimo n = encontrarPrimo 2 1 n

--                p      i      n
encontrarPrimo:: Int -> Int -> Int -> Int
encontrarPrimo p i n | esPrimo p && i == n = p
                     | esPrimo p = encontrarPrimo (p+1) (i+1) n
                     | otherwise = encontrarPrimo (p+1) i n
-- p es el primo de pruebas, i un contador, y n el contador objetivo