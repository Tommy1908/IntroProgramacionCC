--Ejercicio 13 //Le agregue la variable i a F que no estaba definida


f :: Int -> Int -> Int
f n m = fn n m

--     n      m     
fn :: Int -> Int -> Int
fn 1 m = fm 1 m
fn n m = fm i m + fn (i-1) m
        where i = n


--    i de fn  m      suma i^m m veces
fm :: Int -> Int -> Int
fm i 1 = i  --i¹
fm i m = i^m + fm i (m-1)
