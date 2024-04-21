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




--    x      i         con i empezando en 0
soloPares :: Int -> Int -> Int
soloPares x i | mod ultimoDigito 2 == 0 && x < 10 = x * (10^i)
              | mod ultimoDigito 2 == 0 = ultimoDigito * (10^i) + soloPares (sacarUltimoDigito x) (i+1)
              | otherwise = soloPares (sacarUltimoDigito x) i
                  where ultimoDigito = mod x 10
--Devuelve el numero con solo digitos pares. x * (10^i) pone el digito en posicion correcta

sacarUltimoDigito :: Int -> Int
sacarUltimoDigito x = div x 10

mayorDigito