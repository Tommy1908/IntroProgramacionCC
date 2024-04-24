--Ejercicio 4. Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de caracteres sin blancos

holaMundo = ['h','o','l','a',' ',' ','m','u','n','d','o'] :: [Char]
l1 = [' ',' ','h','o','l','a','!',' ',' ',' '] :: [Char]
l2 = [' ','L','I','S','t','a','d','o']
l3 = [' ','L','I','S','t','a','d','o',' ',' ','h','o','l','a','!',' ',' ',' ','h','o','l','a',' ',' ','m','u','n','d','o']
ll4= [['h','o','l','a'],['m','u','n','d','o'],['l','i','s','t','a','s']]


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

{-Ayudado para este codigo. palabras limpia la lista y manda a una funcion aux la lista que queremos separar y una lista vacia.
Por lo general, vamos a querer meter nuestras letras a una lista. Eso lo hacemos con palabra ++ [x], donde metemos nuestra letra en una lista para poder concatenar con...
una lista en principio vacia, y pasamos devuelta donde metimos nuestra letra. Cuando se llega a un espacio metemos a nuestra lista en otra lista en [palabra] y vamos a concatenar..
eso con empezar devuelta con una lista vacia.
Al final, cuando mi lista principal se vacia, metemos lo que teniamos ya guardado en una lista.-}

--d)

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga l = palabraMasLargaAux (palabras(limpiarLista l))

cantidadCaracteres :: [Char] -> Int
cantidadCaracteres [] = 0
cantidadCaracteres (x:xs) = 1 + cantidadCaracteres xs

palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [x] = x
palabraMasLargaAux (x:y:xs) | (cantidadCaracteres x) > (cantidadCaracteres y) = palabraMasLargaAux([x] ++ xs)
                            | otherwise = palabraMasLargaAux([y] ++ xs)

--e)que a partir de una lista de palabras arma una lista de caracteres concatenandolas. (Sin Espacios) //No aplique nada para limpiar la lista

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ (aplanar xs)

--f)que a partir de una lista de palabras, arma una lista de caracteres concatenandolas e insertando un blanco entre cada palabra //No aplique nada para limpiar la lista

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) = x ++ [' '] ++ (aplanarConBlancos xs)

--g)que a partir de una lista de palabras y un entero n, arma una lista de caracteres concatenandolas e insertando n blancos entre cada palabra (n debe ser no negativo)

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ (nEspacios n) ++ (aplanarConNBlancos xs n)

nEspacios :: Integer -> [Char]
nEspacios 0 = []
nEspacios n | n == 1 = [' ']
            | otherwise = [' '] ++ nEspacios (n-1)


---- ¿Como cambian los ejercicios si agregamos el renombre de tipos: type Texto = [Char]? ----
