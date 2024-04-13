--Ejercicio 5. Implementar la funcion medioFact :: Integer ->Integer
--que dado n ∈ N calcula n!! = n (n−2)(n−4)· · · . problema medioFac (n: Z) : Z

medioFact :: Int -> Int
medioFact n | n <= 0 = 1
            | otherwise = n * medioFact(n-2)