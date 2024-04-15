--Ejercicio 8. Implementar la funcion iesimoDigito :: Integer ->Integer ->Integer
--que dado un n ∈ N≥0 y un i ∈ N menor o igual a la cantidad de digitos de n, devuelve el i-esimo digito de n.
{--
problema iesimoDigito (n: Z, i: N) : Z {
requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
asegura: { resultado = (n div 10^cantDigitos(n)−i) mod 10 }
}
problema cantDigitos (n: Z) : N {
requiere: { n ≥ 0 }
asegura: { n = 0 → resultado = 1}
asegura: { n ̸= 0 → (n div 10resultado−1 > 0 ∧ n div 10resultado = 0) }
}
--}

cantDigitos :: Int -> Int
cantDigitos x | x < 10 = 1
cantDigitos x | otherwise = 1 + cantDigitos(div x 10)

--1234 primer=1 segundo=2 ...
iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = mod (div n (10^((cantDigitos n)-i))) 10

--IesimoDigito no tiene recursion, no esta mal, pero seria mejor hacerse con recursion