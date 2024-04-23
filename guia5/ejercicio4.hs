--Ejercicio 4. Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de caracteres sin blancos

holaMundo = ['h','o','l','a',' ',' ','m','u','n','d','o'] :: [Char]
l1 = [' ',' ','h','o','l','a','!',' ',' ',' '] :: [Char]
l2 = [' ','L','I','S','t','a','d','o']
l3 = [' ','L','I','S','t','a','d','o',' ',' ','h','o','l','a','!',' ',' ',' ','h','o','l','a',' ',' ','m','u','n','d','o']


--a)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [y] = y:[]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (' ':xs) --Sacar un ' '
                               | otherwise = x: sacarBlancosRepetidos (y:xs)

--b)
--Primero voy a crear varias funciones para terminar con una que saque los espacios no necesarios (los del principio, los del final, y los dobles)
longitud :: [t] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs)| longitud(x:xs) == 1 = x:[]
              | otherwise = (reverso xs) ++ (x:[])

sacarPrimerBlancos :: [Char] -> [Char]
sacarPrimerBlancos [] = []
sacarPrimerBlancos (x:xs) | x == ' ' = sacarPrimerBlancos xs
                          | otherwise = (x:xs)

limpiarLista :: [Char] -> [Char] --Saca espacios innecesarios
limpiarLista [] = []
limpiarLista l = reverso(sacarPrimerBlancos(reverso(sacarPrimerBlancos(sacarBlancosRepetidos l))))
---------------------------------------------------------------------------------------------------

contarPalabras :: [Char] -> Integer
contarPalabras l = contarPalabrasSBR (limpiarLista l)

contarPalabrasSBR :: [Char] -> Integer --Aux de contar palabras donde se sacaron los blancos repetidos
contarPalabrasSBR [] = 0
contarPalabrasSBR [x] = 1 --Porque la primer palabra no se cuenta, hay que compensar
contarPalabrasSBR (x:xs) | x == ' ' = 1  +  contarPalabrasSBR xs
                         | otherwise = contarPalabrasSBR xs

--c) -- dada una lista arma una nueva lista con las palabras de la lista original.
--[]++[1]++[2] == [1,2]

palabras::[Char] -> [[Char]]
palabras [] = []
palabras l = palabrasAux(limpiarLista l) []

--              Lista    Vacio
palabrasAux :: [Char] -> [Char] -> [[Char]]
palabrasAux [] palabra = [palabra]
palabrasAux (x:xs) palabra | x /= ' ' = palabrasAux xs (palabra ++ [x])
                           | otherwise = [palabra] ++ (palabrasAux xs [])
