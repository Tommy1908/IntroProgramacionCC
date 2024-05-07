{-
-Ejercicio 1
problema hayQueCodificar (c:Char, mapeo:seq<Char x Char>): Bool {
    requiere:{No hay elementos repetidos entre las primeras componenetes de mapeo}
    requiere:{No hay elementos repetidos entre las segundas componentes de mapeo}
    asegura:{res=true <-> c es igual a la primera componente de alguna tupla de mapeo}
}
-}
--Todos los primeros componentes son dif y todos los segundos tambien
mp = [('a','x'),('b','y'),('c','z')]
-- a seria True
-- z seria False
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar c [] = False
hayQueCodificar c ((a,b):xs) | c == a = True
                             | otherwise = hayQueCodificar c xs


{-
-Ejercicio 2
problema cuantasVecesHayQueCodificar (c:Char, frase:[Char], mapeo:seq<Char x Char>): Z { 
    requiere:{No hay elementos repetidos entre las primeras componentes de mapeo}
    requiere:{No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere:{|frase| > 0}
    requiere:{c pertenece a frase}
    asegura:{(res = 0 y hayQueCodificar (c,mapeo)=False) o (res= cantidad de veces que c aparece en frase y hayQueCodificar(c,mapeo)= True)}
}
-}
mp1 = [('y','x'),('b','y'),('c','z')] --Este mapeo tiene que dar 0 para los caracteres de las letras de abajo
--mp2 = [('r','x'),('t','y'),('e','z')] --Este mapeo es valido para contar los c en la f2
f1 = ['h','o','l','a'] :: [Char]
--f2 = ['t','e','r','e','r','e'] :: [Char]

--Para mapeo = [] ya esta resuelto en hayQueCodificar
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar c [] mapeo = 0
cuantasVecesHayQueCodificar c (f:fx) mapeo | not(hayQueCodificar c mapeo) = 0
                                           | c == f = 1 + cuantasVecesHayQueCodificar c fx mapeo
                                           | otherwise = 0 + cuantasVecesHayQueCodificar c fx mapeo

{-
-Ejercicio 3
problema laQueMasHayQueCodificar (frase:[Char], mapeo:[Char x Char]) : Char {
    requiere:{No hay elementos repetidos entre las primeras componenetes de mapeo}
    requiere:{No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere:{|frase| > 0}
    requiere:{Existe al menos un c que pertenece a frase y hayQueCodificar(c,mapeo)=True}
    asegura:{res = c donde c es el caracter tal que cuantasVecesHayQueCodificar(c,frase,mapeo) es mayor a cualquier otro caracter perteneciente a frase}
    asegura:{Si existen mas de un caracter que cumple la condicion anterior devuelve el que aparece primero en la frase}
}
-}
mp2 = [('r','x'),('t','y'),('e','z')]
mp3 = [('a','x'),('t','y'),('b','z')]
f2 = ['t','e','r','e','r','e'] :: [Char]
f3 = ['b','b','a','b','a','b'] :: [Char]

--Ya sabemos que c pertenece a frase y hay que codificar, mapeo no es vacio  y Frase tampoco
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar frase mapeo = laQueMasHayQueCodificarAux frase frase mapeo --Paso dos veces frase para poder comparar apariciones despues en la aux

--                            Chars     frase      mapeo
laQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificarAux [f] frase mapeo = f
laQueMasHayQueCodificarAux (f1:f2:fx) frase mapeo | cuantasVecesHayQueCodificar f1 frase mapeo >= cuantasVecesHayQueCodificar f2 frase mapeo = laQueMasHayQueCodificarAux (f1:fx) frase mapeo
                                                  | otherwise = laQueMasHayQueCodificarAux (f2:fx) frase mapeo

{-
-Ejercicio 4
problema codificarFrase (frase:[Char], mapeo:[Char x Char]) : [Char] {
    requiere:{No hay elementos repetidos entre las primeras componenetes de mapeo}
    requiere:{No hay elementos repetidos entre las segundas componentes de mapeo}
    requiere:{|frase| > 0}
    asegura:{|res| = |frase|}
    asegura:{ Para todo 0 <= i < |frase| si hayQueCodificar(frase[i],mapeo) = True, entonces res[i]=(mapeo[j(1)] para un j tal que 0 <= |mapeo| y mapeo[j(0)]=frase[i])}
    asegura:{ Para todo 0 <= i < |frase| si hayQueCodificar(frase[i],mapeo)= False, entonces res[i]=frase[i]}
}
--Entonces para cada caracter, si hay que codificarlo es falso, dejo la misma letra, sino reemplazo dicha letra por el segundo componente de la tupla que coicide.
-}

--Caso nada que codificar
frase1 = ['t','e','r','e','r','e'] :: [Char]
mapeo1 = [('p','x'),('a','y'),('i','z')]

--Caso solo codificar algunas
frase2 = ['t','e','r','e','r','e'] :: [Char]
mapeo2 = [('p','r'),('t','p'),('e','a')]


codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _ = [] 
codificarFrase (f:fx) mapeo | not(hayQueCodificar f mapeo) = [f] ++ (codificarFrase fx mapeo)
                            | otherwise = codificarFraseAux f mapeo ++ (codificarFrase fx mapeo)

--No puede no ser codificable en esta instancia
codificarFraseAux :: Char -> [(Char,Char)] -> [Char]
codificarFraseAux c ((a,b):xs) | c /= a = codificarFraseAux c xs
                               | otherwise = [b]
                            

--Otros casos
frase3 = ['h','o','l','a'] :: [Char]
mapeo3 = [('h','a'),('o','b'),('l','c'),('a','d')]

frase4 = ['h','o','l','a'] :: [Char]
mapeo4 = [('o','a'),('l','b'),('p','c'),('i','d')]

mapeoABC = [('a','q'),('b','w'),('c','e'),('d','r'),('e','t'),('f','y'),('g','u'),('h','i'),('i','o'),('j','p'),('k','a'),('l','s'),('m','d'),('n','f'),('o','g'),('p','h'),('q','j'),('r','k'),('s','l'),('t','z'),('u','x'),('v','c'),('w','v'),('x','b'),('y','n'),('z','m')]

