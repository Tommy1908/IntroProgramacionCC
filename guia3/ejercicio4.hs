--4)Especificar e implementar las siguientes funciones utilizando tuplas para representar pares, ternas de numeros.

{-A) Voy a asumir que se refiere a (a,b)*(c,d) = a*c + b*d
problema prodInt (x,y: RxR): R {
    Requiere:{true}
    Asegura:{res = (a,b)*(c,d) = a*c + b*d}
-}
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
