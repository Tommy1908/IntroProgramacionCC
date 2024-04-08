--ghci abre haskell
-- :q para salir
-- :l 'name' para cargar
-- :r recargar codigo

doubleMe :: Int -> Int --Asignatura
doubleMe n = n + n     --name variables = funcion

-- '|' es una guarda, y devuelve un valor booleano
-- para numeros negativos en terminal al menos, usar ()

signo :: Int -> Int
signo x | x > 0 = 1
        | x < 0 = -1
        | otherwise = 0

signo2 :: Int -> Int
signo2 0 = 0        -- aca esta aplicado pattern Matching
signo2 x | x > 0 = 1
         | x < 0 = -1

funcion :: Int -> Int
funcion 0 = 0
funcion 5 = 10
funcion (-4) = -7
funcion n = 10000