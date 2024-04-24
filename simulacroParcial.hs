--SIMULACRO DE PARCIAL--
--Listas de prueba
l1 = [("hola","mundo"),("mundo","es"),("prueba","aaa")]
l2 = [("hola","mundo"),("valido","es"),("mundo","aaa")]
nombres = [("tobias","tomas"),("lucas","mirko"),("mirko","matias"),("tomas","matias")]
valida1 = [("tobias","tomas"),("lucas","mirko"),("mirko","matias"),("tomas","matias"),("matias","sofia"),("matias","julian")]
valida2 = [("tobias","ezequiel"),("lucas","mirko"),("mirko","matias"),("tomas","lucas"),("sofia","pedro")]
invalida1 = [("tobias","tomas"),("lucas","mirko"),("tomas","tobias"),("tomas","matias")]


--1)
{-problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas, ni tuplas con ambas componentes iguales}
}-}
--A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales. 

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True 
relacionesValidas [x] = not(componentesIguales x)
relacionesValidas [x,y] = not(componentesIguales x) && not(tuplasRepetidas x y) && not(componentesIguales y)
relacionesValidas (x:y:xs) | not(componentesIguales x) && not(tuplasRepetidas x y) = relacionesValidas ([x] ++ xs) && relacionesValidas ([y]++xs)
                           | otherwise = False 

componentesIguales :: (String,String) -> Bool
componentesIguales (x,y) | x == y = True
                         | otherwise = False

tuplasRepetidas :: (String,String) -> (String,String) -> Bool
tuplasRepetidas (x,y) (a,b) | x == a && y == b = True
                            | y == a && x == b = True
                            | otherwise = False

estaRepetido :: (String,String) -> [(String, String)] -> Bool
estaRepetido (a,b) (x:xs) | tuplasRepetidas (a,b) x = True
                          | otherwise = estaRepetido (a,b) xs



--2)
{-
problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
} -}

--Toma relaciones Validas
personas :: [(String, String)] -> [String]
personas [] = []
personas l = personasAux l

personasAux :: [(String, String)] -> [String]
personasAux [] = []
personasAux (x:xs) = quitarRepetidos([fst x] ++ [snd x] ++ (personasAux xs))


quitarRepetidos :: [String] -> [String]
quitarRepetidos [] = []
quitarRepetidos (x:xs) | (pertenece x xs) = (quitarRepetidos xs)
                       | otherwise = [x] ++ (quitarRepetidos xs)

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = (pertenece n xs)



--3)
{-problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
} -}

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe persona (x:xs) | (esAmigo persona x) = [(devolverAmigo persona x)] ++ (amigosDe persona xs)
                        | otherwise = amigosDe persona xs


esAmigo :: String -> (String, String) -> Bool
esAmigo persona (x,y) | persona == x = True
                      | persona == y = True
                      | otherwise = False

devolverAmigo :: String -> (String, String) -> String
devolverAmigo persona (x,y) | persona == x = y
                            | otherwise = x



--4)
{-
problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}-}
--Requiere relaciones no vacia

longitud :: [String] -> Int
longitud [] = 0
longitud (x:xs) = 1 + (longitud xs)

personaConMasAmigos :: [(String, String)] -> String 
personaConMasAmigos [] = ""
personaConMasAmigos l = personaConMasAmigosAux(personas l) l

personaConMasAmigosAux :: [String] -> [(String, String)] -> String
personaConMasAmigosAux (x:y:xs) l | longitud (x:y:xs) == 2 && longitud(amigosDe x l) >= longitud(amigosDe y l) = x
                                  | longitud (x:y:xs) == 2 && longitud(amigosDe x l) < longitud(amigosDe y l) = y
                                  | longitud(amigosDe x l) > longitud(amigosDe y l) = (personaConMasAmigosAux (x:xs) l)
                                  | otherwise = (personaConMasAmigosAux (y:xs) l)


--ENUNCIADO
{-
 Ejercicio 1
Para empezar a diseñar la novedosa y rupturista red social Y el famoso Elio Mark nos ha pedido que desarrollemos algunas funciones básicas, que tendrán como objetido representar algunas relaciones e interacciones entre los usuarios. Para esto nos envió las siguientes especificaciones en lenguaje semiformal y nos pidió que hagamos el desarrollo enteramente en Haskell, utilizando los tipos requeridos y solamente las funciones que se ven en Introducción a la Programación de Exactas-UBA.

problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales.

problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
}

problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
}

problema personaConMasAmigos (relaciones: seq⟨String x String⟩) : String {
  requiere: {relaciones no vacía}
  requiere: {relacionesValidas(relaciones)}
  asegura: {res es el Strings que aparece más veces en las tuplas de relaciones (o alguno de ellos si hay empate)}
}
-}