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
mayorDigitoPar x | digito == 0 = -1 --Si me devuelve 0 significa que no habia pares
                 | otherwise = digito
                  where digito = (mayorDigito (soloPares x 0))



--             x      i         con i empezando en 0 para poder asignar posiciones
soloPares :: Int -> Int -> Int
soloPares x i | mod ultimoDigito 2 == 0 && x < 10 = x * (10^i)
              | mod ultimoDigito 2 == 0 = ultimoDigito * (10^i) + soloPares (sacarUltimoDigito x) (i+1)
              | otherwise = soloPares (sacarUltimoDigito x) i
                  where ultimoDigito = mod x 10
--Devuelve el numero con solo digitos pares. x * (10^i) pone el digito en posicion correcta



mayorDigito :: Int -> Int
mayorDigito x | x < 10 = x
                | ultimoDigito <= anteUltimoDigito = mayorDigito (sacarUltimoDigito x)
                | ultimoDigito > anteUltimoDigito = mayorDigito( (sacarUltimoDigito x) - anteUltimoDigito + ultimoDigito) --ej 1234 -> 123 - 3 + x = 12X 
                  where ultimoDigito = mod x 10
                        anteUltimoDigito = div (mod x 100) 10
--Devuelve el mayor digito



sacarUltimoDigito :: Int -> Int
sacarUltimoDigito x = div x 10