--Ejercicio 9. Especificar e implementar una funcion esCapicua :: Integer -> Bool que dado n ∈ N≥0 determina si n es un numero capicua.

cantDigitos :: Int -> Int
cantDigitos x | x < 10 = 1
              | otherwise = 1 + cantDigitos(div x 10)

--Invertir el numero
invertirNum :: Int -> Int
invertirNum 0 = 0
invertirNum x = ultimoNum * (10^((cantDigitos x) -1)) + invertirNum(div x 10)
            where ultimoNum = mod x 10

--Notar que ningun numero terminado con 0 es capicua
--No es necesario pero voy a usar recursion solo por si acaso
esCapicua :: Int -> Bool
esCapicua x | x < 10 = True
            | otherwise = x == invertirNum x





--No funciona bien 
{--
esCapicua :: Int -> Bool
esCapicua x| x < 10 = True
--          |otherwise = ultimoNum == primerNum && esCapicua(div (x - primerNumCompleto ) 10)
           |otherwise = ultimoNum == primerNum && esCapicua(x - primerNumCompleto - (div x 10))
            where ultimoNum = mod x 10
                  primerNum = div x (10^ ((cantDigitos x) - 1))
                  primerNumCompleto = div x (10^ ((cantDigitos x) - 1)) * (10^ ((cantDigitos x) - 1))
--}

--Si un numero es menor a 10, es True, ya que 212, cuando le saque 2, queda 1, el numero central es irrelevante en los capicua
--Sino, toma el ultimo numero y el primero, si son iguales, repito el codigo pero sacando el ultimo numero y el primero
--Notar que primer Num y ultimo num solo sirven de comparacion, son un digito, y que primerNunCompleto me devuelve en 212, 200, resto eso y queda 212
--Y div 12 10 saca el ultimo numero.

-- ERROR!!-- 2012 DA TRUE