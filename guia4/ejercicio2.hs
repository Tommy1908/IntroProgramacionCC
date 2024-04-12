--Ejercicio 2. Implementar una funcion parteEntera :: Float ->Integer segun la siguiente especificacion:

-- problema parteEntera (x: R) : Z {
-- requiere: { True }
-- asegura: { resultado ≤ x < resultado + 1 }
-- }

--Solo para Positivos--
parteEntera :: Float -> Int
parteEntera x | 0 < x && x < 1 = 0
              | otherwise = 1 + parteEntera1 (x-1)

--Para Positivos y Negativos--
parteEnteraFull :: Float -> Int
parteEnteraFull x | (-1) < x && x < 1 = 0
--parteEnteraFull x | (abs x) < 1 = 0
                  | x > 0 = 1 + parteEnteraFull (x-1)
                  | x < 0 = (-1) + parteEnteraFull (x+1)