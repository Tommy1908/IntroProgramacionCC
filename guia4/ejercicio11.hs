--Ejercicio 11. a) Especificar e implementar una funcion eAprox :: Integer -> Float que aproxime el valor del numero 'e' a partir de la siguiente sumatoria:

-- problema eAprox (x: Z) : R {
-- requiere: { True }
-- asegura: { resultado = Sumatoria de 0 a N de (1/(i!)) }
-- }

-- n >= 0

factorial :: (Num t , Eq t) => t -> t
--factorial :: (Num t, Eq t, Num t1, Eq t1) => t -> t1
--factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial(n-1)

eAprox :: Int -> Float
eAprox 1 = 1
eAprox n = (1/factorial n) + eAprox(n-1)