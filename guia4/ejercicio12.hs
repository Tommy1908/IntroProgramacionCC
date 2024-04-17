--Ejercicio 12

raizDe2Aprox :: Int -> Float
raizDe2Aprox n = (an n) - 1


an :: Int -> Float
an 1 = 2
an n = 2 + (1/an(n-1))
