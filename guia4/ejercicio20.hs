--Ejercicio 20. Especificar e implementar la funcion tomaValorMax :: Int -> Int -> Int
--que dado un numero entero n1 ≥ 1 y un n2 ≥ n1 devuelve algun m entre n1 y n2 tal que sumaDivisores(m) = max{sumaDivisores(i) | n1 ≤ i ≤ n2}

--Este ejercicio estaba mal especificado, un profesor explico que la idea era que entre un rango de numeros, devuelvas el numero, cuya suma de divisores sea mas grandes
--Ej 2 5. divisores 2 = 2,1 divisores 3 = 3,1 divsores 4= 4,2,1 divisores 5 = 5,1
-- 2+1 = 3, 3+1 = 4, 4+2+1 = 7, 5+1 = 6, por lo tanto devuelvo 4. En caso de que de igual devuelvo alguno y con eso me conformo. No aclara nada.

--En el requiere el numero es mayor igual a 1.

esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True --Llegaste perfecto
                | x < 0 = False --Se paso
                | otherwise = esDivisible (x-y) y --A 'a' ir restando 'b' (dividir como en primaria)

--                Num  Contador
sumarDivisores :: Int -> Int -> Int
sumarDivisores 1 _ = 1
sumarDivisores _ 1 = 1
sumarDivisores n i | esDivisible n i = i + sumarDivisores n (i-1)
                   | otherwise = sumarDivisores n (i-1)

tomaValorMax :: Int -> Int -> Int  --Primero >=1 y segundo >=primero
tomaValorMax x z = tomaValorMaxAux x (x+1) z

--X es el valor inicial, y Z el valor final del intervalo. Y va a ser el valor que almacena
tomaValorMaxAux :: Int -> Int -> Int -> Int
tomaValorMaxAux x y max | y > max = x --Cuando ya probe todos los casos, devuelvo el valor que venia almacenando (el mayor)
                        | sumarDivisores x x >= sumarDivisores y y = tomaValorMaxAux x (y+1) max --Si los divisores de X son mayores, pruebo con X y el siguiente de Y
                        | otherwise = tomaValorMaxAux y (y+1) max  --Si los divisores de Y son mayores, pruebo con Y y el siguiente de Y
