--Ejercicio 7. Implementar la funcion todosDigitosIguales :: Integer -> Bool
--que determina si todos los digitos de un numero natural son iguales, es decir:
{--
problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los digitos de n son iguales }
}--}

todosDigitosIguales :: Int -> Bool
todosDigitosIguales x | x < 10 = True
                      | otherwise = mod x 10 == anteultimoDigito && todosDigitosIguales(div x 10)
                      where anteultimoDigito = div(mod x 100) 10
--Este codigo, prueba que el ultimo digito es igual al anteultimo digito, por eso no importa probar el primer digito