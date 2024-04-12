{--Ejercicio 8. Implementar una funci´on comparar :: Integer ->Integer ->Integer
problema comparar (a:Z, b:Z) : Z {
requiere: {T rue}
asegura: {(res = 1 ↔ sumaU ltimosDosDigitos(a) < sumaU ltimosDosDigitos(b))}
asegura: {(res = −1 ↔ sumaU ltimosDosDigitos(a) > sumaU ltimosDosDigitos(b))}
asegura: {(res = 0 ↔ sumaU ltimosDosDigitos(a) = sumaU ltimosDosDigitos(b))}
}
problema sumaUltimosDosDigitos (x: Z) : Z {
requiere: {T rue}
asegura: {res = (|x| m´d 10) + (⌊(|x|/10)⌋ mod 10)}
}
Por ejemplo:
comparar 45 312 ⇝ -1 porque 45 ≺ 312 y 4 + 5 > 1 + 2.
comparar 2312 7 ⇝ 1 porque 2312 ≺ 7 y 1 + 2 < 0 + 7.
comparar 45 172 ⇝ 0 porque no vale 45 ≺ 172 ni tampoco 172 ≺ 45.--}

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x =  (mod (absoluto x) 10) + (mod (div (absoluto x) 10) 10)
--Mod x 10 te devuelve el ultimo numero
--Div x 10 te saca el ultimo numero

absoluto:: Int -> Int
absoluto 0 = 0
absoluto x| x < 0 = -x
          | otherwise = x

comparar:: Int -> Int -> Int
comparar x y | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
             | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
             | otherwise = 0