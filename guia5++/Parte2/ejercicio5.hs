--Ejercicio 5. En este ejercicio trabajaremos con lockers de una facultad.

type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
data Disponibilidad = Libre | Ocupado deriving (Eq, Show)


1. Implementar existeElLocker :: Identificacion -> MapaDeLockers -> Bool, una funcion para saber si un locker
existe en la facultad.
2. Implementar ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion, una funcion que dado un
locker que existe en la facultad, me dice la ubicacion del mismo.
3. Implementar estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool, una funcion que dado un
locker que existe en la facultad, me devuelve Verdadero si esta libre.
4. Implementar ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers, una funcion que dado un locker que existe en la facultad, y esta libre, lo ocupa.
Para resolverlo usaremos un tipo MapaDelockers que sera una secuencia de locker.
Cada locker es una tupla con la primera componente correspondiente al numero de identificacion, y la segunda componente
el estado.
El estado es a su vez una tupla cuya primera componente dice si esta ocupado o libre, y la segunda componente es un
texto con el codigo de ubicacion del locker.
{-
Opcional: Pueden usar el tipo enumerado data Disponibilidad = Libre | Ocupado
Por ejemplo, un posible mapa de lockers puede ser:
lockers =
[
(100,(Ocupado,"ZD39I")),
(101,(Libre,"JAH3I")),
(103,(Libre,"IQSA9")),
(105,(Libre,"QOTSA")),
(109,(Ocupado,"893JJ")),
(110,(Ocupado,"99292"))
]
-}