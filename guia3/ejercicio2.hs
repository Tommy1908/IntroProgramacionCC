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


maximo3:: Int -> Int -> Int -> Int
maximo3 x y z| x >= y && x >= z = x 
             | y >= z = y --sabemos x no es maximo
             | otherwise = z --sabemos que no es y

sumaDistintos:: Int -> Int -> Int -> Int
sumaDistintos x y z| x == y && x == z = x --todos iguales
                   | x == y = x + z
                   | x == z = x + y
                   | y == z = x + y
                   | otherwise = x + y + z

--i)
digitoUnidades:: Int -> Int
digitoUnidades n|n >= 0 = mod n 10
                |otherwise = mod n (-10) 