{-
La Unidad de Tecnologias de la Información (UTI) de nuestra Facultad nos ha encargado que desarrollernos un nuevo sistema para el registro de alumnos.
En este sistema se guarda la informacion de cada alumno, que esta representada como una tupla de dos elementos:
el primero es el nombre completo del alumno y el segundo una lista con las notas de los finales que rindio
Para implementar este sistema nos enviaron las siguientes especificaciones y nos pidieron que hagamos el desarrollo enteramente en Haskell,
utilizando los tipos requeridos y solamente las funciones que se ven en la materia introduccion a la Programación/Algoritmos y Estructuras de Datos I (FCEYN-UBA)
-}

--Ejercicio 1
{-
problema aproboMasDeNMaterias (registro: seq<seq<Char> x seq<Z>>,alumno:seq<Char>,n:Z):Bool{
    requiere:{No hay nombres de alumnos repetidos en registro}
    requiere:{Las notas de registro son todas mayores o iguales a cero y menores o iguales a 10}
    requiere:{n>0}
    requiere:{El alumno se encuentra en el registro}
    asegura:{Res=True <-> el alumno tiene mas de n notas de finales mayores o iguales a 4 en el registro}
}
--No hay nombres repetidos, y como alumno se encuentra en el registro, al menos hay un elemento cuyo nombre de alumno sea alumno
-}

--aproboMasDeNMaterias [("Matas",[2,5,8]),("Tommy",[10,10,9]),("Agus Sanin",[10,10,10]),("Mirko wolf",[4,8,10]),("a",[1,2,3])] "Matas" 2

aproboMasDeNMaterias :: [([Char],[Int])] -> [Char] -> Int -> Bool
aproboMasDeNMaterias ((name,(g:gs)):xs) alumno n | alumno == name = n < materiasAprobadas (g:gs)
                                                 | otherwise = aproboMasDeNMaterias xs alumno n

materiasAprobadas :: [Int] -> Int
materiasAprobadas [] = 0
materiasAprobadas (g:gs) | g >= 4 = 1 + materiasAprobadas gs
                         | otherwise = materiasAprobadas gs

--Ejercicio 2
{-
problema buenosAlumnos (registro: seq<seq<Char> x seq(Z)>>): seq<seq<Char>> {
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
    asegura: {res es la lista de los nombres de los alumnos que están en registro cuyo promedio de notas es mayor o igual a 8 y no tiene aplazos osea, notas menores que 4}
Para resolver el promedio pueden utilizar la función del Preludio de Hasks fromIntegral que dado un valor de tipo Int devuelve su equivalente de tipo Float
-}

buenosAlumnos :: [([Char],[Int])] -> [[Char]]
buenosAlumnos [] = []
buenosAlumnos ((name,notas):xs) | promedioDeNotas notas >= 8 && not (aplaso notas) = [name] ++ buenosAlumnos xs 
                                | otherwise = buenosAlumnos xs 

promedioDeNotas :: [Int] -> Float
promedioDeNotas [] = 0
promedioDeNotas notas = fromIntegral(sumaDeNotas notas) / fromIntegral(cantidadDeNotas notas)

sumaDeNotas :: [Int] -> Int
sumaDeNotas [] = 0
sumaDeNotas (x:xs) = x + (sumaDeNotas xs)

cantidadDeNotas :: [Int] -> Int
cantidadDeNotas [] = 0
cantidadDeNotas (x:xs) = 1 + cantidadDeNotas xs

aplaso :: [Int] -> Bool
aplaso [] = False
aplaso (x:xs) | x < 4 = True || aplaso xs
              | otherwise = aplaso xs


--Ejercicio 3
{-
problema mejorPromedio (registro: seq<seq<Char> x seq(Z)>>): seq<Char> {
    requiere: {No hay nombres de alumnos repetidos en registro}
    requiere: {Las notas de registro son todas iguales o mayores a cero y menores o iguales a 10}
    requiere: {|registro|>0}
    asegura: {res es el nombre del alumno cuyo promedio de notas es el mas alto; si hay mas de un alumno con el mismo promedio de notas,devuelve el nombre de alumno que aparece primero en registro}
-}

mejorPromedio :: [([Char],[Int])] -> [Char]
mejorPromedio [(name,(g:gs))] = name
mejorPromedio ((name1,notas1):(name2,notas2):xs) | promedioDeNotas notas1 >= promedioDeNotas notas2 = mejorPromedio ((name1,notas1):xs)
                                                 | otherwise = mejorPromedio ((name2,notas2):xs)

--Ejercicio 4
{-
problema seGraduoConHonores (registro: seq<seq<Char> x seq(Z)>>,canitadDeMateriasDeLaCarrera: Z, alumno: seq<Char>): Bool {
    requiere:{No hay nombres de alumnos repetidos en registro}
    requiere:{Las notas de registro son todas mayores o iguales a cero y menores o iguales a 10}
    requiere:{CantidadDeMateriasDeLaCarreras > 0}
    requiere:{El alumno se encuentra en el registro}
    requiere:{|buenosAlumnos(registro)| > 0}
    asegura: {res <-> True si aproboMasDeNMaterias(registro,alumno,(cantidadDeMateriasDeLaCarrera - 1) )= True y alumno pertenece al conjunto de buenosAlumnos(registro) y 
    el promedio de notas de finales de alumno esta a menos estrictamente de 1 punto del mejorPromedio(Registro)}
}
-}

seGraduoConHonores :: [([Char],[Int])] -> Int -> [Char] -> Bool
seGraduoConHonores ((name,notas):xs) cantidadDeMaterias alumno | alumno == name = seGraduoConHonoresAux ((name,notas):xs) (name,notas) cantidadDeMaterias alumno
                                                               | otherwise = seGraduoConHonores xs cantidadDeMaterias alumno
---                        Registro            AlumnoTupla   cantmat   alumno
seGraduoConHonoresAux :: [([Char],[Int])] -> ([Char],[Int]) -> Int -> [Char] -> Bool
seGraduoConHonoresAux registro (name,notas) cantidadDeMaterias alumno = (aproboMasDeNMaterias registro alumno (cantidadDeMaterias-1)) && (perteneceABuenosAlumnos registro alumno) && ultimaCondicion registro notas


perteneceABuenosAlumnos :: [([Char],[Int])] -> [Char] -> Bool
perteneceABuenosAlumnos registro alumno = perteneceABuenosAlumnosAux (buenosAlumnos registro) alumno

perteneceABuenosAlumnosAux :: [[Char]] -> [Char] -> Bool
perteneceABuenosAlumnosAux [] alumno = False
perteneceABuenosAlumnosAux (x:xs) alumno | x == alumno = True
                                         | otherwise = perteneceABuenosAlumnosAux xs alumno
    
--                  Registro            Notas
ultimaCondicion :: [([Char],[Int])] -> [Int] -> Bool
ultimaCondicion registro notas = ((mejorPromedioNota registro (mejorPromedio registro)) - (promedioDeNotas notas) < 1)

--                     Registro          Alumno
mejorPromedioNota :: [([Char],[Int])] -> [Char] -> Float
mejorPromedioNota ((name,notas):xs) alumno | name == alumno = promedioDeNotas notas
                                           | otherwise = mejorPromedioNota xs alumno