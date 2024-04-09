{-Ejercicio 3
Implementar una funcion estanRelacionados :: Integer ->Integer ->Bool
problema estanRelacionados (a:Z, b:Z) : Bool {
requiere: {a ̸= 0 ∧ b ̸= 0}
asegura: {(res = true) ↔ a ∗ a + a ∗ b ∗ k = 0 para alg´un k ∈ Z con k ̸= 0)}
}
Por ejemplo:
estanRelacionados 8 2 ⇝ True porque existe un k = −4 tal que 82 + 8 × 2 × (−4) = 0.
estanRelacionados 7 3 ⇝ False porque no existe un k entero tal que 72 + 7 × 3 × k = 0.
-}

-- /= es not equal
--Como no puedo comprobar si un numero es float, voy a verificar que el resultado es el mismo con el K resultante
-- (div (-(a*a)) (a*b)) = K          
------------yo puedo crear una variable dentro de mi codigo? ----ej estanRelacionados a b  |a/=0 && b/=0 = (k=(div (-(a*a)) (a*b)))----
estanRelacionados :: Int -> Int -> Bool 
estanRelacionados a b  |a/=0 && b/=0 = (a * a) + (a * b * (div (-(a*a)) (a*b))) == 0