--Ejercicio 4. Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de caracteres sin blancos

holaMundo = ['h','o','l','a',' ','m','u','n','d','o'] :: [Char]

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [y] = y:[]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (' ':xs) --Sacar un ' '
                               | otherwise = x: sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
