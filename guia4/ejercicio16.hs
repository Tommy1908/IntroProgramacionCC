--Ejercicio 16. Recordemos que un entero p > 1 es primo si y solo si no existe un entero k tal que 1 < k < p y k divida a p

--a) Implementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado como parametro.

--               >1
menorDivisor :: Int -> Int
menorDivisor x| mod x 2 == 0 = 2  --Todo numero par su menor divisor es 2
              | otherwise = encontrarDivisorDesde 2 x

--Devuelve i, cuando sea el menor divisor
encontrarDivisorDesde :: Int -> Int -> Int
encontrarDivisorDesde i x | mod x i == 0 = i
                          | otherwise = encontrarDivisorDesde (i+1) x

--b) Implementar la funcion esPrimo :: Integer -> Bool que indica si un numero natural pasado como parametro es primo.

--Un numero es primo si solo es divisible por 1 y si mismo, todos son divisibles por 1, y que sea por si mismo solamente es que su minimoDivisor sea si mismo

esPrimo :: Int -> Bool
esPrimo x = x == menorDivisor x

--c) Implementar la funcion sonCoprimos :: Integer ->Integer ->Bool que dados dos n´umeros naturales indica si no tienen algun divisor en comun mayor estricto que 1.

--Creo que seria mas eficiente con una lista, pero voy a comparar el primer divisor de un numero, con todos los del segundo y asi, como si fuera una sumatoria

--              x      y          El not porque si alguno es igual, NO son coprimos. La doble x o y son para crear un contador hacia abajo de ellos mismos
sonCoprimos :: Int -> Int -> Bool
sonCoprimos x y = not (contadorX x x y)

--            i      x      y      
contadorX :: Int -> Int -> Int -> Bool
contadorX 1 x y = False --No se cuenta el divisor 1
contadorX i x y | esDivisor i x = contadorY i y y || contadorX (i-1) x y --Divisor | Con un True es suficiente para NO ser coprimos
                | otherwise = contadorX (i-1) x y --No divisor

--            i      j      y    
contadorY :: Int -> Int -> Int -> Bool
contadorY i 1 y = False --No se cuenta el divisor 1
contadorY i j y | esDivisor j y = i==j || contadorY i (j-1) y --Divisor | Con un True es suficiente para NO ser coprimos
                | otherwise = contadorY i (j-1) y --No divisor


esDivisor :: Int -> Int -> Bool --X es divisor de Y
esDivisor x y = mod y x == 0