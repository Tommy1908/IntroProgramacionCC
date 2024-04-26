--Ejercicio 5. En este ejercicio trabajaremos con lockers de una facultad.

type Texto = [Char]
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)

lockers = [(100,(Ocupado,"ZD39I")),(101,(Libre,"JAH3I")),(103,(Libre,"IQSA9")),(105,(Libre,"QOTSA")),(109,(Ocupado,"893JJ")),(110,(Ocupado,"99292"))]
--lockers2 = [(100,(Ocupado,"OCUPADO")),(101,(Libre,"LIBRE")),(102,(Ocupado,"OCUPADO")),(103,(Libre,"LIBRE"))] --Lo usea para el ultimo ejercicio


--1. Implementar existeElLocker :: Identificacion -> MapaDeLockers -> Bool, una funcion para saber si un locker existe en la facultad.

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False
existeElLocker identificador (x:xs) | identificador == darIdentificador x = True 
                                    | otherwise = existeElLocker identificador xs


--2. Implementar ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion, una funcion que dado un locker que existe en la facultad, me dice la ubicacion del mismo.
--Parecido a una auxiliar que ya hice abajo

ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDelLocker _ [] = "Locker no encontrado"
ubicacionDelLocker identificador (x:xs) | identificador == darIdentificador x = darUbicacion x  --Auxiliar de abajo
                                        | otherwise = ubicacionDelLocker identificador xs


--3. Implementar estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool, una funcion que dado un locker que existe en la facultad, me devuelve Verdadero si esta libre.

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Disponibilidad
estaDisponibleElLocker _ [] = Ocupado
estaDisponibleElLocker identificador (x:xs) | identificador == darIdentificador x = darDisponibilidad x
                                            | otherwise = estaDisponibleElLocker identificador xs


--4. Implementar ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers, una funcion que dado un locker que existe en la facultad, y esta libre, lo ocupa.

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker _ [] = []
ocuparLocker identificador lockers | not(existeElLocker identificador lockers) = lockers
                                   | (estaDisponibleElLocker identificador lockers) == Libre = ocuparLockerAux identificador lockers
                                   | otherwise = lockers

--Ya se que esta, y que esta ocupado
ocuparLockerAux :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLockerAux identificador (x:xs) | identificador == (darIdentificador x) = [ocupar x] ++ xs
                                     | otherwise = [x] ++ ocuparLockerAux identificador xs

ocupar :: Locker -> Locker
ocupar (ident,(disp,ubi)) = (ident,(Ocupado,ubi))



--Funciones Auxiliares Generales--

darIdentificador :: Locker -> Identificacion
darIdentificador (ident,(disp,ubi)) = ident

darDisponibilidad :: Locker -> Disponibilidad
darDisponibilidad (ident,(disp,ubi)) = disp

darUbicacion :: Locker -> Ubicacion
darUbicacion (ident,(disp,ubi)) = ubi