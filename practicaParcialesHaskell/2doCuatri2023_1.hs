{-Introducción a la Programación
* Podrás utilizar las siguientes funciones del prelude
   * Listas: head, tail, last, init, length, elem, ++
   * Tuplas: fst, snd
   * Operaciones lógicas: &&, ||, not
   * Constructores de listas: (x:xs), []
   * Constructores de tuplas: (x,y)
Viva la democracia:
La elección periódica de los gobernantes es la base de los Estados Modernos. Este sistema, denominado "democracia" (término proveniente de la antigua Grecia), tiene diferentes variaciones, que incluyen diferentes formas de elección del/a máximo/a mandatario/a. Por ejemplo, en algunos países se eligen representantes en un colegio electoral (EEUU). En otros se vota a los/as miembros del parlamento (España). En nuestro país elegimos de forma directa la fórmula presidencial (Presidente/a y Vicepresidente/a) cada 4 años.
A continuación presentamos una serie de ejercicios que tienen como objetivo implementar funciones para sistema de escrutinio de una elección presidencial. Leer las descripciones y especificaciones e implementar las funciones requeridas en Haskell, utilizado sóĺamente las herramientas vistas en clase.
Las fórmulas presidenciales serán representadas por tuplas (String x String), donde la primera componente será el nombre del candidato a presidente, y la segunda componente será el nombre del candidato a vicepresidente.
En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos representará la cantidad de votos obtenidos por la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] y la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos.
-}
------------------------------------------

{-
1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
 asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int

------------------------------------------


2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
 requiere: {True}
 asegura: {(res = true) <=> formulas no contiene nombres repetidos, es decir que cada candiadato esta en mas de una formula 
           (no puede ser candidato a presidente y a vicepresidente ni en la misma formula ni en formulas distintas)  }
------------------------------------------


3) Porcentaje de Votos [3 puntos]
problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
 requiere: {La segunda componente de algún elemento de formulas es vice}
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}|
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
}
Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.
------------------------------------------


4) Menos Votado [3 puntos]
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 requiere: {|formulas| > 0}
 asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
}-}


{-A continuación te dejamos una estructura básica para resolver los ejercicios.
Este código no pretende resolver ningun caso de los ejercicios planteados, es sólo una plantilla.-}

{-
-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int  -> Float
porcentajeDeVotosAfirmativos _ _ _ = 0


-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas _ = True


-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos _ _ _ = 0.0


-- Ejercicio 4
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado _ _ = ""
-}




-----------------------------------------------------------------------------------------------------------

--Empiezo por el ejercicio 2 para

l1 = [("Miguel","Marcos"),("Miriam","Julian"),("Sam","Mateo"),("Lucas","Pablo")] --Valida
l2 = [("Miguel","Marcos"),("Miriam","Julian"),("Marcos","Miguel"),("Marcos","Miguel")] --Invalida

formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = True
formulasInvalidas (x:xs) | not(elementosDuplicados x) = not(apareceEnLista x xs) && formulasInvalidas xs
                         | otherwise = False

apareceEnLista :: (String,String) -> [(String, String)] -> Bool
apareceEnLista _ [] = False
apareceEnLista (a,b) ((c,d):xs) | a == c || a == d || b == c || b == d = True
                                | otherwise = apareceEnLista (a,b) xs

elementosDuplicados :: (String, String) -> Bool
elementosDuplicados (a,b) | a==b = True
                          | otherwise = False

-----------------------------------------------

--Ej 1

--req: {¬formulasInvalidas(formulas)}
--req: {|formulas| = |votos|}
--req: {Todos los elementos de votos son mayores o iguales a 0}
--req: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos} (el ulitmo parametro, entiendo que hay q sumarlos a mano porque sino seria otra funcion)
--as: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos} totalVotos/votosACandidatos

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)


f1 = [("Miguel","Marcos"),("Miriam","Julian"),("Sam","Mateo"),("Lucas","Pablo")]
v1 = [98,34,14,64] :: [Int]
--210 = 100% 
v2 = [0,304,0,74] :: [Int]
--378 = 100%

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int  -> Float
porcentajeDeVotosAfirmativos [] [] 0 = 100 --Yo entiendo que si no hubo votos en blanco, y tampoco hubo votados, el 100% de los votos (0) fueron efectivos, no blancos
porcentajeDeVotosAfirmativos [] [] _ = 0   --Yo entiendo que si no hubo votados, pero hubo votos, el 0% fueron efectivos porque no fueron a ningun candidato 
porcentajeDeVotosAfirmativos formulas votos votosTotales = (division (sumaVotosAfirmativos formulas votos) votosTotales)*100

sumaVotosAfirmativos :: [(String, String)] -> [Int] -> Int 
sumaVotosAfirmativos [] [] = 0 --Se supone que igualmente no llegan casos []
sumaVotosAfirmativos (x:xs) (y:ys) | xs /= [] = y + sumaVotosAfirmativos xs ys
                                   | otherwise = y

-----------------------------------------------

--Ej 3

--req: {La segunda componente de algún elemento de formulas es vice}
--req: {¬formulasInvalidas(formulas)}
--req: {|formulas| = |votos|}|
--req: {Todos los elementos de votos son mayores o iguales a 0}
--req: {Hay al menos un elemento de votos mayores estricto a 0}
--as: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
 
--                    vice         formulas          votos
porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = division (votosVice vice formulas votos) (sumaVotosAfirmativos formulas votos) 

votosVice :: String -> [(String, String)] -> [Int] -> Int
votosVice vice [] [] = 0
votosVice vice ((x,y):xs) (v:vs) | vice == y = v 
                                 | otherwise = votosVice vice xs vs


-----------------------------------------------

--Ej 4

--req: {¬formulasInvalidas(formulas)}
--req: {|formulas| = |votos|}
--req: {Todos los elementos de votos son mayores o iguales a 0}
--req: {Hay al menos un elemento de votos mayores estricto a 0}
--req: {|formulas| > 0}
--as: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
--Asumo que si hay dos con la menor cantidad devuelvo cualquiera

--                  formulas         votos
menosVotado :: [(String, String)] -> [Int] -> String
menosVotado [(x,y)] [v] = x
menosVotado ((x,y):(a,b):xs) (v:v2:vs) | v <= v2 = menosVotado ((x,y):xs) (v:vs)
                                       | otherwise = menosVotado ((a,b):xs) (v2:vs)