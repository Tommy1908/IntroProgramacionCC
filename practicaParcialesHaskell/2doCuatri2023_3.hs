{-
¡Vamos Campeones!
En exactas se está jugando un torneo de fútbol y la facultad le pidió a los alumnos de IP programar algunas
funcionalidades en Haskell, Los datos con los que contamos para esto son los nombres de los equipos que participan
del torneo, los nombres de los arqueros titulares de cada uno de dichos equipos, y la cantidad de goles recibidos
por esos arqueros. Los nombres de los equipos y sus respectivos arqueros serán modelados mediante tuplas de tipo
(String, String), donde la primera componente representa el nombre del equipo, y la segunda representa el nombre
del arquero titular de dicho equipo.
En los problemas en los cuales se reciben como parámetros secuencias arquerosPorEquipo y goles, cada posición de
la lista goles representará la cantidad de goles recibidos por el arquero del equipo que se encuentra en esa misma
posicion de arquerosPorEquipo. Por ejemplo, si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"),
("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], eso indicaría que Neyder Aragon recibió 3 goles, y
Nahuel Galardi 5.

Se pueden usar las siguientes funciones del preludio:
	- Listas: head, tail, last, init, length, elem, ++
	- Tuplas: fst, snd
	- Operaciones Lógicas: &&, ||, not
	- Constructores de listas: (x:xs), []
	- Constructores de tuplas: (x, y)
-}

{-
2) Ejercicio 2
problema equiposValidos (arquerosPorEquipo: seq<String X String>): Bool {
	requiere: {True}
	asegura: {(res = True) <=> arquerosPorEquipo no contiene nombres de clubes repetidos, ni arqueros repetidos, ni jugadores con nombre del club}
}-} --Si no hay jugadores con nombres de club, tampoco la vuelta. Por lo tanto quiero que nada se repita con nada

eq0 = [("a","x"),("b","b"),("c","a")] --Invalida
eq1 = [("a","x"),("b","y"),("c","z")] --Valida

equiposValidos :: [(String,String)] -> Bool
equiposValidos [] = True
equiposValidos [(a,b)] = a /= b
equiposValidos ((a,b):(c,d):xs) | a == b = False
                                | a == c || a == d || b == c || b == d = False
                                | otherwise = equiposValidos ((a,b):xs) && equiposValidos ((c,d):xs)


{-
1) Ejercicio  1
problema atajaronSuplentes (arquerosPorEquipo: seq<String X String>, goles: seq<Z>, totalGolesTorneo: Z): Z {
	requiere: {equiposValidos(arquerosPorEquipo)
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {La suma de todos los elementos de goles es menor o igual a totalGolesTorneo}
	asegura: {res es la cantidad de goles recibidos en el torneo por arqueros que no son titulares en sus equipos.}
}-}
--Misma cantidad de arqueros q goles

gol = [5,3,9] ::[Int] -- 17
--Res es el total de goles - atajados por arqueros titulares
atajaronSuplentes :: [(String,String)] -> [Int] -> Int -> Int
atajaronSuplentes arqueros golesTitulares golesTotales = golesTotales - (totalGolesTitulares golesTitulares)

totalGolesTitulares :: [Int] -> Int
totalGolesTitulares [] = 0
totalGolesTitulares (x:xs) = x + totalGolesTitulares xs

{-
3) Ejercicio3
problema porcentajeDeGoles (arquero: String, arquerosPorEquipo: seq<String X String>, goles: seq<Z>): R {
	requiere: {La segunda componente de algún elemento de arquerosPorEquipo es arquero}
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {Hay al menos un elemento de goles mayores estricto a 0}
	asegura: {res es el porcentaje de goles que recibió arquero sobre el total de goles recibidos por arqueros titulares}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como float la división entre dos
numeros de tipo Int.
-}
division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

--Por requiere el arquero si pertenece a la lista. --Hay al menos un elemento de goles > 0 por lo tanto no hay caso vacio
porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeGoles arquero equipos goles = (division (cuantosGoles arquero equipos goles) (totalGolesTitulares goles)) * 100


--Se que seguro arquero es un elemento de la lista por requiere
cuantosGoles :: String -> [(String,String)] -> [Int] -> Int
cuantosGoles arquero ((a,b):xs) (g:gs) | arquero == b = g
                                       | otherwise = cuantosGoles arquero xs gs

{-
4) Ejercicio 4
problema vallaMenosVencida (arquerosPorEquipo: seq<String X String>, goles: seq<Z>): String {
	requiere: {equiposValidos(arquerosPorEquipo)}
	requiere: {|arquerosPorEquipo| = |goles|}
	requiere: {Todos los elementos de goles son mayores o iguales a 0}
	requiere: {|goles| > 0}
	asegura: {res es alguno de los arqueros de arquerosPorEquipo que menor goles recibió de acuerdo a goles}
}-}

vallaMenosVencida :: [(String,String)] -> [Int] -> String
vallaMenosVencida [(a,b)] _ = b
vallaMenosVencida ((a,b):(c,d):xs) (g1:g2:gs) | g1 <= g2 =  vallaMenosVencida ((a,b):xs) (g1:gs)
                                              | otherwise = vallaMenosVencida ((c,d):xs) (g2:gs)