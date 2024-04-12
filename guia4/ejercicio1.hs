--Ejercicio 1. Implementar la funcion fibonacci:: Integer -> Integer que devuelve el i-esimo numero de Fibonacci.--
{--
n=0 = 0
n=1 = 1
otherwise = fib(n-1) + fib(n-2)
Entonces 
--}

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)