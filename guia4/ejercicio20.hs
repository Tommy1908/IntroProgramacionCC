--Ejercicio 20. Especificar e implementar la funcion tomaValorMax :: Int -> Int -> Int
--que dado un numero entero n1 ≥ 1 y un n2 ≥ n1 devuelve algun m entre n1 y n2 tal que sumaDivisores(m) = max{sumaDivisores(i) | n1 ≤ i ≤ n2}

esDivisible :: Int -> Int -> Bool
esDivisible x y | x == 0 = True --Llegaste perfecto
                | x < 0 = False --Se paso
                | otherwise = esDivisible (x-y) y --A 'a' ir restando 'b' (dividir como en primaria)