--La introduccion de este parcial son las mismas del parcial nro1, y el puntaje estimo que sera el mismo.

-----------------------------------------------

--Ej 2 y empiezo por el 2 porque es mejor entender formulasValidas Primero pasa saber que van a recibir las otras
{-
problema formulasValidas (formulas: seq < String String>): Bool{
    req: {True}
    as: {(res = true) <-> formulas no contiene nombres repetidos, es decir que cada candidato está en una única fórmula
        (se puede ser candidato a presidente y a vicepresidente ni en la misma fórmula ni en fórmulas distintas)} }
-}

l1 = [("Miguel","Marcos"),("Miriam","Julian"),("Sam","Mateo"),("Lucas","Pablo")] --Valida
l2 = [("Miguel","Marcos"),("Miriam","Julian"),("Marcos","Miguel"),("Marcos","Miguel")] --Invalida

formulasValidas :: [(String,String)] -> Bool
formulasValidas [] = True
formulasValidas [(a,b)] = not(a == b) --Si son iguales quiero que sea False, porque no es valido
formulasValidas ((a,b):(c,d):xs) | a == b = False
                                 | a == c || a == d || b == c || b == d = False
                                 | otherwise = formulasValidas ((a,b):xs) && formulasValidas ((c,d):xs)



-----------------------------------------------

--Ej 1

{-
problema votosEnBlanco (formulas: seq <String x String>, votos: seq<Z>, cantTotalVotos: Z): Z{
    req: {formulasValidas(formulas)}
    req: {|formulas|=|votos|}
    req: { Todos los elementos de votos son mayores o iguales que 0}
    req: { La suma de todos los elementos de votos es menor o igual a cantTotalVotos)
    as: {res es la cantidad de votos emitidos que no correspondieron a niguna de las fórmulas que se presentaron}}
-}

c1 = [("Miguel","Marcos"),("Miriam","Julian"),("Sam","Mateo"),("Lucas","Pablo")] --Valida
v1 = [2,6,3,7] :: [Int] -- 18 votos

votosEnBlanco :: [(String,String)] -> [Int] -> Int -> Int
votosEnBlanco _ votosACandidatos totalVotos = totalVotos - (sumaDeVotos votosACandidatos)

sumaDeVotos :: [Int] -> Int --Realmente no importan los candidatos porque por req son de igual Longitud
sumaDeVotos [] = 0
sumaDeVotos [x] = x
sumaDeVotos (x:xs) = x + (sumaDeVotos xs)


-----------------------------------------------

--Ej 3

{-problema porcentajeDeVotos (presidente: String, formulas: seq<String x String>, votos: seq<Z>): R{
req: {La primera componente de algun elemento de formulas es presidente}
req: {formulasValidas(formulas)}
req: {|formulas|=|votos|}
req: { Todos los elementos de votos son mayores o iguales que 0}
req: { Hay al menos un elemento de votos que es mayor estricto que 0}
as: {res es el porcentaje de votos que obtuvo la fórmula encabezada por presidente sobre el total de votos afirmativos } Entiendo por votos afirmativos a los no blancos
} -}
--Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:

division:: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float --Al haber un elemento mayor a 0, hay por lo menos 1 candidato o eso creo, no tendria que preocuparme por ese caso
porcentajeDeVotos _ [x] _ = 100
porcentajeDeVotos presidente candidatos votos = division (votosDe presidente candidatos votos) (sumaDeVotos votos) 

votosDe ::  String -> [(String,String)] -> [Int] -> Int
votosDe presidente [] [] = 0
votosDe presidente ((x,y):xs) (v:vs) | presidente == x = v
                                     | otherwise = votosDe presidente xs vs



-----------------------------------------------

--Ej 4

{- problema proximo Presidente (formulas: seq<String x String>, votos: seq<Z>): String{ 
req: {La primera componente de algun elemento de formulas es presidente}  (? Creo que no me dice nada)
req: {formulasValidas (formulas)}
req: {|formulas|=|votos|}
req: { Todos los elementos de votos son mayores o iguales que 0}
req: { Hay al menos un elemento de votos que es mayor estricto que 0}
req: {|formulas|>0} --Por requiere no puede haber []
as: {res es el candidato a presidente de formulas más votado de acuerdo a los votos contabilizados en votos} } -}

proximoPresidente :: [(String,String)] -> [Int] -> String
proximoPresidente [(a,b)] _ = a
proximoPresidente ((a,b):(c,d):xs) (v:v2:vs) | v >= v2 = proximoPresidente ((a,b):xs) (v:vs)
                                             | otherwise = proximoPresidente ((c,d):xs) (v2:vs)