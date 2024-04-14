--Ejercicio 7. Implementar la funcion todosDigitosIguales :: Integer -> Bool
--que determina si todos los digitos de un numero natural son iguales, es decir:
{--
problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los digitos de n son iguales }
}--}

todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | x == 0 = 4
                      | otherwise = mod x 10 == k && todosDigitosIguales(div x 10)
                      where k = mod x 10