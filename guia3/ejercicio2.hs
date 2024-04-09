--2)Especificar e implementar las siguientes funciones, incluyendo su signatura.

{-A) 
problema absoluto (x: Z): N {
    Requiere:{true}
    Asegura:{res = |x|}
-}
absoluto:: Int -> Int
absoluto 0 = 0
absoluto x| x < 0 = -x
          | otherwise = x  

{-B)
problema maximoabsoluto (x,y: Z): N {
    Requiere:{True}
    Asegura:{res = el mayor absoluto}
}
-}
maximoAbsoluto:: Int -> Int -> Int
maximoAbsoluto x y| absoluto x >= absoluto y = absoluto x
                  | otherwise = absoluto y

{-C)
problema maximo3 (x,y,z: Z): Z {
    Requiere:{True}
    Asegura:{res es mayor a igual a X, a Y y a Z}
    Asegura:{res es igual a X, o Y o Z}  Evita que si el input es 1 2 3, 4 sea un valor valido
}
-}
maximo3:: Int -> Int -> Int -> Int
maximo3 x y z| x >= y && x >= z = x 
             | y >= z = y --sabemos x no es maximo
             | otherwise = z --sabemos que no es y

{-D)
problema algunoEs0 (x,y: R): Bool
    Requiere:{True}
    Asegura:{Res = True, si X o Y es 0}
-}
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False

algunoEs0pm:: Float -> Float -> Bool --PM Pattern Matching
algunoEs0pm 0 y = True
algunoEs0pm x 0 = True
algunoEs0pm x y = true

{-E)
problema AmbosSon0 (x,y: R): Bool
    Requiere:{True}
    Asegura:{Res = True, si X y Y son 0}
-}
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

{-F)
problema mismoIntervalo (x,y: R): Bool
    Requiere:{True}
    Asegura:{Res = True, si X,YE'mismo intervalo'}
-}
mismoIntervalo:: Float -> Float -> Bool
mismoIntervalo x y | x == y = True
                   | x <= 3 && y <= 3 = True
                   | x <= 7 &&  x > 3 && y > 3 && y <= 7 = True
                   | x > 7 && y > 7 = True
                   | otherwise = False

{-G)
problema sumaDistintos (x,y,z: Z): Z
    Requiere:{True}
    Asegura:{Res = La suma de los x,y,z no repetidos}
-}
sumaDistintos:: Int -> Int -> Int -> Int
sumaDistintos x y z| x == y && x == z = x --todos iguales
                   | x == y = x + z
                   | x == z = x + y
                   | y == z = x + y
                   | otherwise = x + y + z

{-H)
problema esMultiploDe (x,y: N): bool
    Requiere:{True}
    Asegura:{Res = True si Y MOD X == 0}
-}
esMultiploDe :: Int -> Int -> Bool --Primero multiplo del Segundo
esMultiploDe x y | mod x y == 0 = True
                 | otherwise = False

{-I)
problema digitoUnidades (x,y: N): bool
    Requiere:{True}
    Asegura:{Res = ultimo numero}
-}
digitoUnidades:: Int -> Int
digitoUnidades n|n >= 0 = mod n 10
                |otherwise = mod n (-10)

{-J)
problema digitoDecenas (x,y: N): bool
    Requiere:{True}
    Asegura:{Res = ultimos 2 numeros}
-}
digitoDecenas:: Int -> Int
digitoDecenas n|n >= 0 = mod n 100
               |otherwise = mod n (-100)