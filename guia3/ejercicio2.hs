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