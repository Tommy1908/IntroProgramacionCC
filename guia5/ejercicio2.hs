---Seguro sea util-----
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs)| longitud(x:xs) == 1 = x:[]
              | otherwise = (reverso xs) ++ (x:[])
-------------------------


pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = False --Digo yo eh
todosIguales (x:xs) | longitud (x:xs) == 1 = True --El ultimo ya fue comparado
                    | otherwise = pertenece x xs && todosIguales xs

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = False --Digo yo eh
todosDistintos (x:xs) | longitud (x:xs) == 1 = True --El ultimo ya fue comparado
                      | otherwise = not(pertenece x xs) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) | longitud (x:xs) <= 1 = False
                    | pertenece x xs = True
                    | otherwise = hayRepetidos xs

--SACA SOLO 1 VEZ
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x:quitar n xs

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | x == n = quitarTodos n xs
                     | otherwise = x : quitarTodos n xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = x : eliminarRepetidos(quitarTodos x xs)
                         | otherwise = x: eliminarRepetidos xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] _ = False
mismosElementos _ [] = False
mismosElementos (x:xs) (y:ys) | pertenece x (y:ys) = True && (mismosElementos (quitarTodos x xs) (quitarTodos x (y:ys)))
                              | otherwise = False

capicua :: (Eq t) => [t] -> Bool
capicua l = l == reverso l


--Adicional, me equivoque en un ejercicio y quedo esto-------------
aPertenceaB :: (Eq t) => [t] -> [t] -> Bool
aPertenceaB [] [] = True --Digo yo
aPertenceaB [] _ = False
aPertenceaB (x:xs) l | longitud (x:xs) == 1 = pertenece x l
                     | pertenece x l = True && aPertenceaB xs l
                     | otherwise = False 
-------------------------------------------------------------------
