--Ejercicio 3. Especificar e implementar la funcion esDivisible :: Integer -> Integer -> Bool 
--que dados dos numeros naturales determinar si el primero es divisible por el segundo. No esta permitido utilizar las funciones mod ni div.

{--esDivisible (x,y:R) Bool
Requiere:{x,y son Naturales}
Asegura:{}
--}

esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True --Llegaste perfecto
                | x < 0 = False --Se paso
                | otherwise = esDivisible (x-y) y --A 'a' ir restando 'b' (dividir como en primaria)