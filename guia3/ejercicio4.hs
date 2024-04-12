--4)Especificar e implementar las siguientes funciones utilizando tuplas para representar pares, ternas de numeros.

{-A) Voy a asumir que se refiere a (a,b)*(c,d) = a*c + b*d
problema prodInt (x,y: RxR): R {
    Requiere:{true}
    Asegura:{res = (a,b)*(c,d) = a*c + b*d}
-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
prodInt:: (Float,Float) -> (Float,Float) -> Float
prodInt (a,b) (c,d) = a*c + b*d

{-B)
problema todoMenor (x,y: RxR): Bool {
    Requiere:{true}
    Asegura:{res = true si cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla}
-}
todoMenor:: (Float,Float) -> (Float,Float) -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

{-C)
problema distanciaPunto (x,y: RxR): R {
    Requiere:{true}
    Asegura:{res = distancia entre 2 puntos }
-}
distanciaPunto :: (Float,Float) -> (Float,Float) -> Float --MODULO de A-A + B-A
distanciaPunto (a,b) (c,d) = sqrt((c-a)^2+(d-b)^2)

{-D)
problema sumaTerna (x: ZxZxZ)
    Requiere:{true}
    Asegura:{res = suma de los 3 elementos de x }
-}
sumaTerna :: (Int,Int,Int) -> Int
sumaTerna (a,b,c) = a + b + c

{-E)
problema sumarSoloMultiplos (x: ZxZxZ y:N)
    Requiere:{true}
    Asegura:{res =  la suma de los elementos de la terna que son multiplos del n´umero natural }
-}
esMultiploDe :: Int -> Int -> Bool --Primero multiplo del Segundo
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False

sumarSoloMultiplos :: (Int,Int,Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) n | esMultiploDe a n && esMultiploDe b n && esMultiploDe c n = a + b + c
                             | esMultiploDe a n && esMultiploDe b n  = a + b
                             | esMultiploDe a n && esMultiploDe c n = a  + c
                             | esMultiploDe b n && esMultiploDe c n = b  + c
                             | esMultiploDe a n= a
                             | esMultiploDe b n= b
                             | esMultiploDe c n= c
                             | otherwise = 0

--MEJOR IDEA, CON AYUDA DEL PROFE

esMultiplo :: Int -> Int -> Int --Si es multiplo devuelve el numero, sino 0
esMultiplo x y | mod x y == 0 = x
               | otherwise = 0

sumarSoloMultiplosMejor :: (Int,Int,Int) -> Int -> Int
sumarSoloMultiplosMejor (a,b,c) n = ((esMultiplo a n) + (esMultiplo b n) + (esMultiplo c n))


{-posPrimerPar: dada una terna de enteros, devuelve la posici´on del primer n´umero par si es que hay alguno, y devuelve
4 si son todos impares.-}
posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (a,b,c) | mod a 2 == 0 = 1
                     | mod b 2 == 0 = 2
                     | mod c 2 == 0 = 3
                     | otherwise = 4

{--crearPar :: a ->b ->(a, b): crea un par a partir de sus dos componentes dadas por separado (debe funcionar para
elementos de cualquier tipo).--}

crearPar :: a -> b -> (a,b)
crearPar a b = (a,b)

{--invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como par´ametro (debe funcionar para elementos
de cualquier tipo).--}

invertir :: (a,b) -> (b,a)
invertir (a,b) = (b,a)
