longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs)| longitud(x:xs) == 1 = x:[]
              | otherwise = (reverso xs) ++ (x:[])

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [y] = y:[]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (' ':xs) --Sacar un ' '
                               | otherwise = x: sacarBlancosRepetidos (y:xs)

sacarPrimerBlancos :: [Char] -> [Char]
sacarPrimerBlancos [] = []
sacarPrimerBlancos (x:xs) | x == ' ' = sacarPrimerBlancos xs
                          | otherwise = (x:xs)

limpiarLista :: [Char] -> [Char] --Saca espacios innecesarios
limpiarLista [] = []
limpiarLista l = reverso(sacarPrimerBlancos(reverso(sacarPrimerBlancos(sacarBlancosRepetidos l))))


l1 = ['h','o',' ','p','o',' ','c']


palabras::[Char] -> [[Char]]
palabras [] = []
palabras l = palabrasAux(limpiarLista l) []

--              Lista    Vacio
palabrasAux :: [Char] -> [Char] -> [[Char]]
palabrasAux [] palabra = [palabra]
palabrasAux (x:xs) palabra | x /= ' ' = palabrasAux xs (palabra ++ [x])
                           | otherwise = [palabra] ++ (palabrasAux xs [])