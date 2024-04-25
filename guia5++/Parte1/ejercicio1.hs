--Ejercicio 1. Especificar e implementar las siguientes funciones utilizando tuplas para representar pares, ternas de numeros.

--a) Reimplementar ejercicio 4a prodInt: calcula el producto interno entre dos tuplas R × R. Usar type Punto2D = (Float,Float)
--prodInt: calcula el producto interno entre dos tuplas R × R

--Definimos un nuevo tipo
type Punto2D = (Float, Float)

prodInt :: Punto2D -> Punto2D -> Float
prodInt (a,b) (c,d) = (a*c) + (b*d)

--b) Reimplementar ejercicio 4b de la guia 3 todoMenor: dadas dos tuplas R × R
--decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.

todoMenor:: Punto2D -> Punto2D -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

--c) Reimplementar ejercicio 4c de la guia 3: distanciaPuntos: calcula la distancia entre dos puntos de R^2

distanciaPunto :: Punto2D -> Punto2D -> Float --MODULO de A-A + B-A
distanciaPunto (a,b) (c,d) = sqrt((c-a)^2+(d-b)^2)

--D) Reimplementar funci´on del ejercicio 4g, de la guia 3: crearPar :: Float ->Float -> coordenada

--Definimos un nuevo tipo
type Coordenada = (Float, Float)

crearPar :: Float -> Float -> Coordenada
crearPar a b = (a,b)