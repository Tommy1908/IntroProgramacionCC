--Ejercicio 10. Especificar, implementar y dar el tipo de las siguientes funciones (simil Ejercicio 4 Practica 2 de Algebra 1).

f1 :: Int -> Int
f1 0 = 0
f1 n = 2^n + f1(n-1)



f2 :: Int -> Float -> Float
f2 1 q = q
f2 n q = (q^n) + f2(n-1) q


--f2 n q | n == 1 = q
--       | otherwise = (q^n) + f2(n-1) q