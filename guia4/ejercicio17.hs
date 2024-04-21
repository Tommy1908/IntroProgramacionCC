--Ejercicio 17. Implementar la funci´on esFibonacci :: Integer ->Bool segun la siguiente especificacion:
{-
problema esFibonacci (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es algun valor de la secuencia de Fibonacci definida en el ejercicio 1}
}-}

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

esFibonacci :: Int -> Bool
esFibonacci x = fibContador 0 x

--              i      x
fibContador :: Int -> Int -> Bool
fibContador i x | x == fib i = True
                | fib i > x = False
                | otherwise = fibContador (i+1) x
--Si el numero de fib se pasa, no petenece, si es menor podemos seguir contando