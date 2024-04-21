--Ejercicio 18. Implementar una funcion mayorDigitoPar :: Integer ->Integer segun la siguiente especificacion:
{-
problema mayorDigitoPar (n: N) : N {
requiere: { T rue }
asegura: { resultado es el mayor de los digitos pares de n. Si n no tiene ningun digito par, entonces resultado es -1.}}-}

-- 123 = 2
-- 2478 = 8
-- 357 = -1
-- 888 = 8
-- 111 = -1

mayorDigitoPar :: Int -> Int
mayorDigitoPar x | x < 10 =
                 | x

esMayorDigitos :: Int -> Int
esMayorDigitos x | ultimoDigito >= anteultimoDigito = ultimoDigito
                 | otherwise = anteultimoDigito
                  where ultimoDigito = mod x 10
                        anteultimoDigito = div(mod x 100) 10

--         i=1    x
soloPar :: Int -> Int -> Int
soloPar i x | mod x 2 == 0 = soloPar (10^i) x
soloPar i x | mod x 2 /= 0 = div x 10