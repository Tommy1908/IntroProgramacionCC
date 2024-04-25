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



