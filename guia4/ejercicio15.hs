--Ejercicio 15. Especificar e implementar una funcion sumaRacionales :: Integer ->Integer ->Float
--que dados dos naturales n, m sume todos los numeros racionales de la forma p/q con 1 ≤ p ≤ n y 1 ≤ q ≤ m.

--                 n      m
sumaRacionales :: Int -> Int -> Float --Se encarga de N
sumaRacionales 1 m = sumatoriaM 1 m
sumaRacionales n m = sumatoriaM n m + sumaRacionales (n-1) m

--             n      m
sumatoriaM :: Int -> Int -> Float --Se encarga de M, recibe N
sumatoriaM n 1 = fromIntegral(n) -- n/1
sumatoriaM n m = n/(fromIntegral m) + sumatoriaM n (m-1)