--Ejercicio 14. Especificar e implementar una funcion sumaPotencias :: Integer ->Integer ->Integer ->Integer
--que dados tres naturales q, n, m sume todas las potencias de la forma q^a+b con 1 ≤ a ≤ n y 1 ≤ b ≤ m.


--La cantidad de posibilidades entre N y M es N*M, por lo tanto la cantidad de iteraciones

--                Q      N      M
sumaPotencias :: Int -> Int -> Int -> Int  --Va a controlar A
sumaPotencias q 1 m = sumatoria q 1 m
sumaPotencias q n m = sumatoria q n m + sumaPotencias q (n-1) m


--             Q      N      M
sumatoria ::  Int -> Int -> Int -> Int --Va a controlar B, recibe A con un valor ya
sumatoria q n 1 = q^(n+1)                         --q^1
sumatoria q n m = q^(n+m) + sumatoria q n (m-1)