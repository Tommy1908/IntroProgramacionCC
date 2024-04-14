--Ejercicio 6. Especificar e implementar la funcion sumaDigitos :: Integer ->Integer
--que calcula la suma de digitos de un numero natural. Para esta funcion pueden utilizar div y mod.

-- problema sumaDigitos (x: Z) : Z {
-- requiere: { x > 0 }
-- asegura: { res = suma de cada digito de x}
-- }

sumaDigitos :: Int -> Int
sumaDigitos x | x == 0 = 0
              | otherwise = ultimoDigito + sumaDigitos (div x 10)
              where ultimoDigito = mod x 10