--Ejercicio 2. Reimplementar la funcion del ejercicio 6 de la guia 3 usando:

{-
bisiesto :: Año ->EsBisiesto
problema bisiesto (año: Z) : Bool {
requiere: {True}
asegura: {res = false ↔ año no es multiplo de 4 o año es multiplo de 100 pero no de 400}
}
Por ejemplo:
bisiesto 1901 ⇝ False, bisiesto 1904 ⇝ True,
bisiesto 1900 ⇝ False, bisiesto 2000 ⇝ True.
-}

type Año = Integer
type EsBisiesto = Bool

bisiesto :: Año -> EsBisiesto
bisiesto x | (mod x 100 == 0) = (mod x 400 == 0)
           | otherwise = (mod x 4 == 0)

