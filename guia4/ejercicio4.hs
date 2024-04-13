--Ejercicio 4. Especificar e implementar la funcion sumaImpares :: Integer -> Integer
--que dado n ∈ N sume los primeros n numeros impares. Por ejemplo: sumaImpares 3 -> 1+3+5 ⇝ 9.

sumaImparesNoRecursiva :: Int -> Int
sumaImparesNoRecursiva x = x^2 

sumaImpares :: Int -> Int
sumaImpares x| x == 0 = 0
             | otherwise = nEsimoImpar + sumaImpares(x-1)
        where nEsimoImpar = (2*x)-1