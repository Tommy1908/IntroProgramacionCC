--Ejercicio 3. Reimplementar el ejercicio 7 de la guia 3 usando: type Coordenada3d = (Float, Float, Float)
{-
distanciaManhattan :: Coordenada3d ->Coordenada3d ->Float
Por ejemplo:
distanciaManhattan (2, 3, 4) (7, 3, 8) ⇝ 9
distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) ⇝ 12.8
-}

type Coordenada3d = (Float, Float, Float)

distanciaManhattan :: Coordenada3d -> Coordenada3d -> Float
distanciaManhattan (a,b,c) (d,e,f) = resta a d + resta b e + resta c f

resta :: Float -> Float -> Float
resta a b = absoluto (a - b)

absoluto:: Float -> Float
absoluto 0 = 0
absoluto x| x < 0 = -x
          | otherwise = x