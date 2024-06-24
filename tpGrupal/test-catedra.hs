import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runCatedraTests = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista,
    "frecuencia" ~: testsEjfrecuencia,
    "cifradoMasFrecuente" ~: testsEjcifradoMasFrecuente,
    "esDescifrado" ~: testsEjesDescifrado,
    "todosLosDescifrados" ~: testsEjtodosLosDescifrados,
    "expandirClave" ~: testsEjexpandirClave,
    "cifrarVigenere" ~: testsEjcifrarVigenere,
    "descifrarVigenere" ~: testsEjdescifrarVigenere,
    "peorCifrado" ~: testsEjpeorCifrado,
    "combinacionesVigenere" ~: testsEjcombinacionesVigenere
    ]


testsEjesMinuscula = test [
    "letra minuscula a" ~: esMinuscula 'd' ~?= True,
    "letra minuscula cualquiera" ~: esMinuscula 'a' ~?= True,
    "letra mayuscula cualquiera" ~:esMinuscula 'D' ~?= False,
    "letra mayuscula A" ~:esMinuscula 'A' ~?= False,
    "Simbolos y caracteres especiales" ~: esMinuscula 'à' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula 'á' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula '*' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula 'Á' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula '*' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula 'ñ' ~?= False,
    "Simbolos y caracteres especiales" ~:esMinuscula ' ' ~?= False
    ]

--Solo toma letras con esMinuscula == True
testsEjletraANatural = test [
    "Primer letra" ~:letraANatural 'a' ~?= 0,
    "Segunda letra" ~:letraANatural 'b' ~?= 1,
    "Letra cualquiera" ~:letraANatural 'h' ~?= 7,
    "Letra cualquiera" ~:letraANatural 'k' ~?= 10,
    "Anteultima letra" ~:letraANatural 'y' ~?= 24,
    "Ultima letra" ~:letraANatural 'z' ~?= 25
    ]

testsEjdesplazar = test [
    "Simbolo" ~: desplazar 'Ñ' 8 ~?= 'Ñ',
    "Simbolo" ~: desplazar ' ' 8 ~?= ' ',
    "Simbolo" ~: desplazar 'ñ' 5 ~?= 'ñ',
    "Simbolo" ~: desplazar '*' 10 ~?= '*',
    "Simbolo" ~: desplazar '*' (-13) ~?= '*',
    "Casos 'regulares' " ~: desplazar 'a' 4 ~?= 'e',
    "Casos 'regulares' " ~: desplazar 'b' 4 ~?= 'f',
    "Casos 'regulares' " ~: desplazar 'x' 1 ~?= 'y',
    "Casos 'regulares' " ~: desplazar 'z' (-1) ~?= 'y',
    "Vuelta hacia atras" ~: desplazar 'a' (-1) ~?= 'z',
    "Vuelta hacia atras" ~: desplazar 'a' (-4) ~?= 'w',
    "Constancia en casos multiplos a 26" ~: desplazar 'a' 26 ~?= 'a',
    "Constancia en casos multiplos a 26" ~: desplazar 'k' 26 ~?= 'k',
    "Constancia en casos multiplos a 26" ~: desplazar 'k' (-26) ~?= 'k',
    "Constancia en casos multiplos a 26" ~: desplazar 'k' (-78) ~?= 'k',
    "Constancia en casos 0" ~: desplazar 'k' 0 ~?= 'k',
    "Constancia en casos 0" ~: desplazar 'p' 0 ~?= 'p',
    "Vuelta hacia adelante" ~: desplazar 'z' 1 ~?= 'a',
    "Vuelta hacia adelante" ~: desplazar 'z' 8 ~?= 'h',
    "Vuelta hacia adelante" ~: desplazar 'z' 26 ~?= 'z',
    "Vuelta hacia adelante" ~: desplazar 'z' 27 ~?= 'a',
    "Vuelta hacia adelante" ~: desplazar 'x' 5 ~?= 'c'
    ]

testsEjcifrar = test [
    cifrar "computacion" 3 ~?= "frpsxwdflrq",
    "Caso vacio" ~: cifrar " " 3 ~?= " ",
    "Caso Simbolos" ~: cifrar "!¿'*+ñÑ^" 6 ~?= "!¿'*+ñÑ^",
    "Caso 0" ~: cifrar "Hola" 0 ~?= "Hola",  
    "Caso 0" ~: cifrar "a" 0 ~?= "a",
    "Casos 'regulares'" ~: cifrar "a" 3 ~?= "d",
    "Casos 'regulares'" ~: cifrar "abcdef" 1 ~?= "bcdefg",
    "Casos 'regulares'" ~: cifrar "abcdefg" 25 ~?= "zabcdef",
    "Casos con mayusculas intercaladas" ~: cifrar "HolA" 1 ~?= "HpmA",
    "Casos con mayusculas intercaladas" ~: cifrar "trAbajo" 26 ~?= "trAbajo",
    "Casos con mayusculas intercaladas" ~: cifrar "trAbajo" 7 ~?= "ayAihqv"
    ]
 
testsEjdescifrar = test [
    descifrar "frpsxwdflrq" 3 ~?= "computacion",
    "Caso vacio" ~: descifrar " " 3 ~?= " ",
    "Simbolos" ~: descifrar "!¿'*+ñÑ^" 6 ~?= "!¿'*+ñÑ^",
    "Caso 0" ~: descifrar "a" 0 ~?= "a",
    "Caso 0" ~: descifrar "hola" 0 ~?= "hola",
    "Caso 0" ~: descifrar "Hola" 0 ~?= "Hola",
    "Mayusculas intercaladas" ~: descifrar "HpmA" 1 ~?= "HolA",
    "Mayusculas intercaladas" ~: descifrar "trAbajo" 26 ~?= "trAbajo",
    "Mayusculas intercaladas" ~: descifrar "ayAihqv" 7 ~?= "trAbajo",
    "Casos 'regulares'" ~: descifrar "d" 3 ~?= "a",
    "Casos 'regulares'" ~: descifrar "bcdefg" 1 ~?= "abcdef",
    "Casos 'regulares'" ~: descifrar "zabcdef" 25 ~?= "abcdefg"
    ]

testsEjcifrarLista = test [
    cifrarLista ["compu", "labo", "intro"] ~?= ["compu", "mbcp", "kpvtq"],
    "Caso Vacio" ~: cifrarLista [] ~?= [],
    "Casos Simbolos" ~: cifrarLista [" "] ~?= [" "],
    "Casos Simbolos" ~: cifrarLista ["*","+","-","/"] ~?= ["*","+","-","/"],
    "Casos 'regulares'" ~: cifrarLista ["abcd"] ~?= ["abcd"],
    "Casos 'regulares'" ~: cifrarLista ["abcd", "abcd", "abcd","abcd"] ~?= ["abcd", "bcde", "cdef", "defg"],
    "Casos 'regulares'" ~: cifrarLista ["Tommy", "Mirko", "Mauro!","*Matas"] ~?= ["Tommy", "Mjslp", "Mcwtq!", "*Mdwdv"], --Notar que cifrar deja las Mayusculas y simbolos
    "Casos 'regulares'" ~: cifrarLista ["xyz", "xyz", "xyz","xyz"] ~?= ["xyz", "yza", "zab", "abc"], 
    "Casos 'regulares'" ~: cifrarLista ["HOLA", "MUNDO"] ~?= ["HOLA", "MUNDO"]
    ]

testsEjfrecuencia = test [
    expectlistProximity (frecuencia "taller") [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0],
    "Simbolos" ~: expectlistProximity (frecuencia "ñ!+Ñ{}") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Vacio" ~: expectlistProximity (frecuencia "") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Mayusculas y minusculas" ~: expectlistProximity (frecuencia "AAAaaa") [100.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Mayusculas y minusculas" ~: expectlistProximity (frecuencia "AAAaaabbb") [50.0,50.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Mayusculas y minusculas" ~: expectlistProximity (frecuencia "Tommy") [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,50.0,0.0,25.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,25.0,0.0],
    "Casos regulares" ~: expectlistProximity (frecuencia "aabbb") [40.0,60.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Casos regulares" ~: expectlistProximity (frecuencia "aabbbcccc") [22.22222,33.33333,44.44444,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Casos regulares" ~: expectlistProximity (frecuencia "aabbbaa") [57.14286,42.857143,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],
    "Todas las letras" ~: expectlistProximity (frecuencia "abcdefghijklmnopqrstuvwxyz") [3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615,3.84615]
    ]

testsEjcifradoMasFrecuente = test [
    cifradoMasFrecuente "taller" 3 ~?= ('o', 33.333336),
    "1 minuscula y resto mayus" ~: cifradoMasFrecuente "HOLa" 26 ~?= ('a', 100),
    "1 minuscula y resto mayus" ~: cifradoMasFrecuente "HOLa" 2 ~?= ('c', 100),
    "Caso 'Regular''" ~: cifradoMasFrecuente "abbcccdddd" 0 ~?= ('d', 40.0),
    "Caso con simbolos" ~: cifradoMasFrecuente "ÑÑÑÑÑÑÑbcdd" 10 ~?= ('n', 50.0),
    "Casos con mas de un resultado posible" ~: expectAnyTuplaAprox (cifradoMasFrecuente "hola" 0) [('h' , 25.0),('o' , 25.0),('l' , 25.0),('a' , 25.0)],
    "Casos con mas de un resultado posible" ~: expectAnyTuplaAprox (cifradoMasFrecuente "los" 7) [('z' , 33.33333),('v' , 33.33333),('s' , 33.33333)]
    ]

testsEjesDescifrado = test [
    esDescifrado "taller" "compu" ~?= False,
    esDescifrado "" "" ~?= True,
    "Caso 'Regular'" ~: esDescifrado "abcd" "fghi" ~?= True,
    "Caso 'Regular'" ~: esDescifrado "abcd" "zabc" ~?= True,
    "Caso 'Regular'" ~: esDescifrado "abcd" "xyza" ~?= True,
    "Caso 'Regular'" ~:esDescifrado "tomas" "computacion" ~?= False,
    "Caso con simbolos'" ~:esDescifrado "abcd" "fGhi" ~?= False,
    "Caso con simbolos" ~: esDescifrado "aabb!!ñÑ*PPyy" "llmm!!ñÑ*PPjj" ~?= True,
    "Caso con simbolos" ~: esDescifrado "aabb!!ñÑ*PPyy" "llnn!!ñÑ*PPjj" ~?= False,
    "Caso vacio" ~: esDescifrado "" "a" ~?= False,
    "Caso vacio" ~: esDescifrado "a" "" ~?= False
    ]

testsEjtodosLosDescifrados = test [
    todosLosDescifrados ["compu", "frpsx", "mywza"] ~?= [("compu", "frpsx"), ("frpsx", "compu")],
    "Caso vacio" ~: todosLosDescifrados [] ~?= [],
    "Caso string vacio" ~: todosLosDescifrados [""] ~?= [],
    "Caso 1 elemento" ~:todosLosDescifrados ["a"] ~?= [],
    "Caso No es descifrado" ~: todosLosDescifrados ["a","ab"] ~?= [],
    "Caso No es descifrado" ~: todosLosDescifrados ["a","agua"] ~?= [],
    "Caso No es descifrado" ~: expectPermutacion (todosLosDescifrados ["Tomas","Matias","Mirko","Mauro"]) [],
    "Simbolos" ~: expectPermutacion (todosLosDescifrados ["HOLAññ", "MUNDO!!", "**COMPUTADORA"]) [],
    "Casos regulares" ~: expectPermutacion (todosLosDescifrados ["a","b"]) [("b","a"),("a","b")],
    "Casos regulares" ~: expectPermutacion (todosLosDescifrados ["computadora","tfdglkrufir","bnlotszcnqz","computadore"]) [("computadora","tfdglkrufir"),("computadora","bnlotszcnqz"),("tfdglkrufir","computadora"),("bnlotszcnqz","computadora"),("tfdglkrufir","bnlotszcnqz"),("bnlotszcnqz","tfdglkrufir")],
    "Casos regulares" ~: expectPermutacion (todosLosDescifrados ["a","b","c"]) [("a","c"),("a","b"),("b","a"),("b","c"),("c","b"),("c","a")]
    ]

testsEjexpandirClave = test [
    expandirClave "compu" 8 ~?= "compucom",
    "Caso longitud 1" ~:expandirClave "compu" 1 ~?= "c",
    "Longitud igual a clave" ~:expandirClave "compu" 5 ~?= "compu",
    "Longitud mas del doble de clave" ~:expandirClave "hola" 9 ~?= "holaholah",
    "Longitud menor a clave" ~:expandirClave "test" 3 ~?= "tes",
    "Primera letra y ultima igual" ~: expandirClave "test" 13 ~?= "testtesttestt"
    ]

testsEjcifrarVigenere = test [
    cifrarVigenere "computacion" "ip" ~?= "kdueciirqdv",
    "Caso vacio" ~: cifrarVigenere "" "ip" ~?= "",
    "Caso igual" ~: cifrarVigenere "hola" "a" ~?= "hola",
    "Caso siguiente" ~: cifrarVigenere "hola" "b" ~?= "ipmb",
    "Caso igual/siguiente" ~: cifrarVigenere "hola" "ab" ~?= "hplb",
    "Caso regular" ~: cifrarVigenere "Licenciatura en Ciencias de la Computacion" "intro" ~?= "Lvvvbkvtkizn vb Cbvbkvtj lr co Chddcgttwwa"
    ]

testsEjdescifrarVigenere = test [
    descifrarVigenere "kdueciirqdv" "ip" ~?= "computacion",
    "Caso vacio" ~: descifrarVigenere "" "ip" ~?= "",
    "Caso igual" ~: descifrarVigenere "hola" "a" ~?= "hola",
    "Caso siguiente" ~: descifrarVigenere "ipmb" "b" ~?= "hola",
    "Caso igual/siguiente" ~: descifrarVigenere "hplb" "ab" ~?= "hola",
    "Caso regular" ~: descifrarVigenere "Lvvvbkvtkizn vb Cbvbkvtj lr co Chddcgttwwa" "intro" ~?= "Licenciatura en Ciencias de la Computacion"
    ]

testsEjpeorCifrado = test [
    peorCifrado "computacion" ["ip", "asdef", "ksy"] ~?= "asdef",
    "Caso vacio" ~: expectAny (peorCifrado "" ["ip", "asdef", "ksy"]) ["ip", "asdef", "ksy"],
    "Caso regular" ~: peorCifrado "buenas" ["ac", "o", "clave"] ~?= "ac",
    "Caso regular" ~: peorCifrado "agosto" ["agosto", "julio"] ~?= "agosto",
    "Caso regular" ~: peorCifrado "jamon" ["agosto", "julio"] ~?= "agosto",
    "Caso 2 cifrados igual de malos" ~: expectAny (peorCifrado "abcd" ["h", "z"]) ["z","h"]
    ]

testsEjcombinacionesVigenere = test [
    combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb" ~?= [("hola", "b")],
    "Caso regular" ~: combinacionesVigenere ["Botella", "asdfg"] ["zafg", "adf"] "Boykklf" ~?= [("Botella", "zafg")],
    "Caso regular" ~: combinacionesVigenere ["Fadu", "Exactas"] ["uba", "utn"] "Fbdo" ~?= [("Fadu", "uba")],
    "Caso 2 tuplas de respuesta" ~: expectPermutacion (combinacionesVigenere ["bcd","abc"] ["a","bb"] "bcd") [("abc","bb"),("bcd","a")],
    "Caso 2 tuplas de respuesta" ~: expectPermutacion (combinacionesVigenere ["d","e","f"] ["a","b","c"] "g") [("f","b"),("e","c")]
    ] 








-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)
