--Ejercicio 21. Especificar e implementar una funcion pitagoras :: Int -> Int -> Int -> Int
--que dados m, n , r ∈ N≥0, cuente cuantos pares (p, q) con 0 ≤ p ≤ m y 0 ≤ q ≤ n satisfacen que p^2 + q^2 ≤ r^2
{-
Por ejemplo:
pitagoras 3 4 5 ⇝ 20
pitagoras 3 4 2 ⇝ 6
-}

--m,n,r son limites, hay que probar las combinaciones menores
--            m      n      r
pitagoras :: Int -> Int -> Int -> Int
pitagoras m n r = valoresX m n r

valoresX :: Int -> Int -> Int -> Int
valoresX x y r | x < 0 = 0
               | otherwise = valoresY x y r + valoresX (x-1) y r

valoresY :: Int -> Int -> Int -> Int
valoresY x y r | y < 0 = 0
               | x^2 + y^2 <= r^2 = 1 + valoresY x (y-1) r
               | otherwise = valoresY x (y-1) r

--Prueba todas las combinaciones de m y n de hasta 0, donde cumpla pitagoras, y las cuenta