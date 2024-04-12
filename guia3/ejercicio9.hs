--Ejercicio 9 A partir de las siguientes implementaciones en Haskell, describir en lenguaje natural que hacen y especificarlas semiformalmente

--A)
-- f1 :: Float -> Float
-- f1 n | n == 0 = 1
-- | otherwise = 0

{- 
f1 (n:R)R
Requiere:{True}
Asegura:{Res = 1 si solo si n es igual a 1}
Asegura:{Res = 0 si solo si n no es igual a 1}
 -}

--b)
-- f2 :: Float -> Float
-- f2 n | n == 1 = 15
-- | n == -1 = -15

{- 
f1 :: (a:R) R
Requiere:{True}
Asegura:{Res = 15 si solo si n es 1 o Res = -15 si solo si n es -1}
 -}

--c)
-- f3 :: Float -> Float
-- f3 n | n <= 9 = 7
-- | n >= 3 = 5

{- 
f3 (a:R)R
Requiere:{True}
Asegura:{res = 7 si y solo si n es menor o igual a 9}
Asegura:{res = 5 si y solo si n es mayor o igual a 3}
 -}

--d)
-- f4 :: Float -> Float -> Float
-- f4 x y = ( x + y )/2

{- 
f4 (x,y:R)R
Requiere:{True}
Asegura:{Res = La mitad de la suma de x + y}
 -}

--e)
-- f5 :: ( Float , Float ) -> Float
-- f5 (x , y ) = ( x + y )/2

{- 
f5 (a:RxR)R
Requiere:{True}
Asegura:{Res: La mitad de la suma del primer elemento con el segundo elemento de 'a'}
 -}

--f)
-- f6 :: Float -> Int -> Bool
-- f6 a b = truncate a == b

{- 
f6 (x:R,Y:N) Bool
Requiere:{True}
Asegura:{Res = True si y solo si la parte entera de X es igual a Y, de lo contrario devuelve Falso}
-}
