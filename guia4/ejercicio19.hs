--Ejercicio 19. Implementar la funcion esSumaInicialDePrimos :: Int -> Bool segun la siguiente especificacion:
{-
problema esSumaInicialDePrimos (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es igual a la suma de los m primeros n´umeros primos, para alg´un m.}
}-}

--Los siguientes 5 bloques del ejercicio 16 nos permiten encontrar el nEsimoPrimo--

menorDivisor :: Int -> Int
menorDivisor x| mod x 2 == 0 = 2  --Todo numero par su menor divisor es 2
              | otherwise = encontrarDivisorDesde 2 x

--Devuelve i, cuando sea el menor divisor
encontrarDivisorDesde :: Int -> Int -> Int
encontrarDivisorDesde i x | mod x i == 0 = i
                          | otherwise = encontrarDivisorDesde (i+1) x

esPrimo :: Int -> Bool
esPrimo x = x == menorDivisor x

--                p      i      n
encontrarPrimo:: Int -> Int -> Int -> Int
encontrarPrimo p i n | esPrimo p && i == n = p
                     | esPrimo p = encontrarPrimo (p+1) (i+1) n
                     | otherwise = encontrarPrimo (p+1) i n
-- p es el primo de pruebas, i un contador, y n el contador objetivo

nEsimoPrimo :: Int -> Int
nEsimoPrimo n = encontrarPrimo 2 1 n

--Yo quiero que dado un numero, determinar si la suma de los primos hasta un 'm' es valida. Es decir:
-- 10 = True porque 2+3+5 es la suma de los primeros 3 primos m=3
-- 58 con m=7 
-- 12 = False porque m=3 es menor y m=4 es mayor

{- esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos x = esSumaInicialDePrimosAux x 1  -}

--                           x      i     suma
{- esSumaInicialDePrimosAux :: Int -> Int -> Int -> Bool
esSumaInicialDePrimosAux x i | nEsimoPrimo i > x = False
                             | nEsimoPrimo i == x = True
                             | otherwise = esSumaInicialDePrimosAux x (i+1)
 -}
sumaPrimos :: Int -> Int
sumaPrimos 0 = 0
sumaPrimos i = nEsimoPrimo i + sumaPrimos (i-1)