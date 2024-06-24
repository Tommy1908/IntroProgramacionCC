module Solucion where
import Data.Char


-- EJ 1
--Compara si el caracter de entrada c esta entre los caracteres 'a' y 'z'

esMinuscula :: Char -> Bool
esMinuscula c     | c >= 'a' && c <= 'z' = True
                  | otherwise = False



-- EJ 2
-- A un caracter c le resta el numero que corresponde a el caracter 'a', entonces (con respecto a 'a') devuelve la diferencia entre ambos caracteres. 

letraANatural :: Char -> Int
letraANatural c = ord c - ord 'a'



-- EJ 3
{- Si no es minuscula devuelve el caracter, calcula el resto de la division n por 26 para ahorar casos que haya que dar varias vueltas al abecedario
si esta dentro del rango donde no hay que "dar la vuelta" calcula cuanto hay que desplazarlo.
Si no queda en rango, resto la cantidad de numeros menos la posicion de la letra (osea cuantas posiciones al final me quedan) y le saco esas posiciones a mi ncongruente
Y le resto 1 mas por la posicion que fuerzo yo ('a') para poder volver a empezar. -}

desplazar :: Char -> Int -> Char
desplazar c n | not (esMinuscula c) = c
              | letraANatural c + nCongruente <= 25 = chr (ord c + nCongruente)
              | otherwise = desplazar 'a' (nCongruente - ((25 - letraANatural c))-1)
                  where nCongruente = mod n 26



-- EJ 4
-- A cada caracter del string de entrada los desplaza n posiciones.

cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (c:cs) n =[desplazar c n] ++ cifrar cs n 



-- EJ 5
-- Hace lo opuesto que cifrar, osea los desplaza -n posiciones.

descifrar :: String -> Int -> String
descifrar cs n = cifrar cs (-n) 



-- EJ 6
--El numero de cifrado es su posicion en la lista. Fuerzo a empezar con 0 a la auxiliar asi el primer caso cifra con 0 luego 1, 2, 3 y asi cuantos elementos haya

cifrarLista :: [String] -> [String]
cifrarLista ls = cifrarListaAux ls 0

cifrarListaAux :: [String] -> Int -> [String]
cifrarListaAux [] _ = []
cifrarListaAux (x:xs) n = [cifrar x n] ++ cifrarListaAux xs (n+1)



-- EJ 7
frecuencia :: String -> [Float]
frecuencia palabra = frecuenciaAux palabra 'a'

-- Para un c tal que a <= c <= z, se fija en que porcentaje aparece c en palabra, y dicho porcentaje lo va concatenando co frecueciaAux palabra c+1.
-- En caso de que no tenga letras minusculas,  concatena [0.0] 26 veces.

frecuenciaAux :: String -> Char -> [Float]
frecuenciaAux palabra 'z'   | totalCharMin palabra == 0 = [0.0] 
                            | otherwise                 = [100*(fromIntegral (aparicionesDe 'z' palabra) / fromIntegral (totalCharMin palabra))]
frecuenciaAux palabra c     | totalCharMin palabra == 0 = [0.0] ++ frecuenciaAux palabra (desplazar c 1)
                            | otherwise                 = [100*( aparicionesFloat/totalDeCharsFloat)] ++ frecuenciaAux palabra (desplazar c 1)
                                where aparicionesFloat  = fromIntegral (aparicionesDe c palabra)
                                      totalDeCharsFloat  = fromIntegral (totalCharMin palabra)

totalCharMin :: String -> Int --Calcula el total de caracters que respetan 'esMinuscula'.
totalCharMin [] = 0 
totalCharMin (c:cs) | not (esMinuscula c) = totalCharMin cs
                    | otherwise = 1 + totalCharMin cs

aparicionesDe :: Char -> String -> Int -- Calcula la cantidad de veces que aparece cPrima en un string.
aparicionesDe _ [] = 0
aparicionesDe cPrima (c:cs) | c == cPrima = 1 + aparicionesDe cPrima cs
                            | otherwise   = aparicionesDe cPrima cs



-- Ej 8
--Cifra el string de entrada y se lo pasa a cifradoMasFrecuenteAux.

cifradoMasFrecuente :: String -> Int -> (Char,Float)
cifradoMasFrecuente palabra n   = cifradoMasFrecuenteAux (cifrar palabra n) 

--Dado un String de entrada, devuelve como de primer elemento de la tupla el caracter mas frecuente y de segundo la frecuencia de dicha caracter. 

cifradoMasFrecuenteAux :: String  -> (Char,Float)                            
cifradoMasFrecuenteAux palabra  = (carMasFrec, frecCaracter)
                                    where carMasFrec   = caracterConMasFrecuencia (soloMinusculas palabra) (soloMinusculas palabra)
                                          frecCaracter = 100*(fromIntegral (aparicionesDe carMasFrec palabra) / fromIntegral (totalCharMin palabra))

--Calcula el caracter con mas frecuencia de un String de entrada. Requiere que los dos strings de entrada sean el mismo.   

caracterConMasFrecuencia :: String -> String -> Char 
caracterConMasFrecuencia (x:[]) palabra = x
caracterConMasFrecuencia (x:xs) palabra | aparicionesDe x palabra >= aparicionesDe (caracterConMasFrecuencia xs palabra) palabra = x
                                        | otherwise = caracterConMasFrecuencia xs palabra

--Erradica todo caracter que no sea minuscula de un String de entrada.

soloMinusculas :: String -> String
soloMinusculas []       = []
soloMinusculas (c:cs)   | not (esMinuscula c)   = soloMinusculas cs
                        | otherwise             = [c] ++ soloMinusculas cs



-- EJ 9
--Sea s1 y s2 el primer y segundo string de entrada respectivamente. Calcula si existe un s1 tal que s2 = cifrar s1 n, para algun n entre 1 y 26. Devuelve true en caso de existir dicho n.

esDescifrado :: String -> String -> Bool
esDescifrado [] [] = True
esDescifrado s1 s2 = esDescifradoAux s1 s2 26

--Si en n 26 son iguales, ya lo eran en principio, de ahi para abajo hasta llegar a 0, un caso igual a 26, para ese momento si no eran iguales ya no lo van a ser

esDescifradoAux :: String -> String -> Int -> Bool
esDescifradoAux s1 s2 0 = False
esDescifradoAux s1 s2 n | s2 == cifrar s1 n = True
                        | otherwise = esDescifradoAux s1 s2 (n-1)



-- EJ 10
--Dado una lista de Strings devuelve una lista de duplas que cumplan esDecifrado entre ambos componentes de dicha dupla. 

todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados xs        = buscarCifrado xs xs

buscarCifrado :: [String] -> [String] -> [(String, String)]
buscarCifrado [] list         = []
buscarCifrado (x:xs) list   | x == ""   = []
                            | otherwise = (buscarCifradoAux x list 25) ++ buscarCifrado xs list  

buscarCifradoAux :: String -> [String] -> Int -> [(String, String)]
buscarCifradoAux str list 0   = []
buscarCifradoAux str list n     | todoMayuscula str     = []
                                | elem strCifrado list  = [(str, strCifrado)] ++ buscarCifradoAux str list (n-1)
                                | otherwise             = buscarCifradoAux str list (n-1)
                                    where strCifrado = (cifrar str n)

todoMayuscula :: String -> Bool
todoMayuscula []        = True
todoMayuscula (x:xs)    | esMinuscula x     = False
                        | otherwise         = todoMayuscula xs



-- EJ 11
--n>0 y clave /= "" y todos los caracteres son minusculas (no char especiales)
--se va concatenando de derecha a izquierda, el mod de (n-1) clave da el caracter correspondiente a esa pos (el n-1 es para alinear el que la lista empieza en 0)

expandirClave :: String -> Int -> String
expandirClave clave 0 = []
expandirClave clave n = expandirClave clave (n-1) ++ [nEsimoElemento clave (mod (n-1) (length clave))]

--Se asume que el n nunca es mayor a length(String)

nEsimoElemento :: String -> Int -> Char
nEsimoElemento (c:cs) n | n == 0 = c
                        | otherwise = nEsimoElemento cs (n-1)



-- EJ 12
--Aplica "desplazar" al elemento en de s en posicion n, que empieza en 0 y va incrementando, y lo desplaza la misma cantidad que la letraANatural del caracter de la clave en dicha posicicion.

cifrarVigenere :: String -> String -> String
cifrarVigenere s clave = cifrarVigenereAux s (expandirClave clave (length s)) 0

cifrarVigenereAux ::  String -> String -> Int -> String 
cifrarVigenereAux s clave n | n == length s = []
                            | otherwise = [desplazar (nEsimoElemento s n) (letraANatural (nEsimoElemento clave n))] ++ cifrarVigenereAux s clave (n+1)



-- EJ 13
--Al igual que cifrar, aplica desplazar pero en valores negativos, con el valor de letraANatural correspondiente de la clave para la poscion de cada caracter

descifrarVigenere :: String -> String -> String
descifrarVigenere s clave = descifrarVigenereAux s (expandirClave clave (length s)) 0

descifrarVigenereAux :: String -> String -> Int -> String 
descifrarVigenereAux s clave n | n == length s = []
                               | otherwise = [desplazar (nEsimoElemento s n) (-(letraANatural (nEsimoElemento clave n)))] ++ descifrarVigenereAux s clave (n+1)



-- EJ 14
peorCifrado :: String -> [String] -> String  --a partir de un string, se fija el valor de ese string cifrado en la funcion distanciaEntreDosSecuencias, si es menor o igual al proximo valor, devuelve la primer clave
peorCifrado [] (x:xs) = x
peorCifrado palabra (x:[]) = x
peorCifrado palabra (x:xs) | distanciaEntreDosSecuencias palabra (cifrarVigenere palabra x) <= distanciaEntreDosSecuencias palabra (cifrarVigenere palabra (peorCifrado palabra xs)) = x
                           | otherwise = peorCifrado palabra xs


--s1 es el no cifrado, el s2 es el cifrado
distanciaEntreDosSecuencias :: String -> String -> Int --la funcion recibe un string comun y el segundo string que recibe es ese mismo pero cifrado
distanciaEntreDosSecuencias (x:[]) (y:[]) = absoluto (letraANatural x - letraANatural y) --   esta linea suma el primer valor de la sumatoria i=0
distanciaEntreDosSecuencias (x:xs) (y:ys) = absoluto ((letraANatural x - letraANatural y)) + distanciaEntreDosSecuencias xs ys -- esta linea va sumando desde la longitud del string hasta cero

absoluto :: Int -> Int
absoluto x | x>=0 = x
           | otherwise = -x



-- EJ 15
--Se fija todas las posibles combinaciones de todos los strings de la primera secuencia con todas las de la segunda secuencia, osea, chequea todas las posibilidades que tienen los cifrados entre todos los mensajes y todas las claves
--Chequea el ultimo mensaje y probas todas las combinaciones de claves, y si termina siendo igual a cifrado lo agrega y si no no
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)] 
combinacionesVigenere [] claves cifrado         = []
combinacionesVigenere (x:xs) claves cifrado     | combinacionesVigenereAux x claves cifrado == [] = combinacionesVigenere xs claves cifrado
                                                | otherwise = (combinacionesVigenereAux x claves cifrado) ++ combinacionesVigenere xs claves cifrado


combinacionesVigenereAux :: String -> [String] -> String -> [(String, String)] --esta funcion sirve para evaluar solo un mensaje con una lista de todas las claves
combinacionesVigenereAux mensaje (x:[]) cifrado       | cifrarVigenere mensaje x == cifrado = [(mensaje,x)] -- si el cifrado es igual a el mensaje cifrado con la ultima clave, lo agrega a la lista
                                                      | otherwise = []
combinacionesVigenereAux mensaje (x:xs) cifrado       | cifrarVigenere mensaje x == cifrado = [(mensaje,x)] ++ combinacionesVigenereAux mensaje xs cifrado --misma logica que arriba solo que pueden haber mas de un caso que te de el cifrado
                                                      | otherwise = combinacionesVigenereAux mensaje xs cifrado
