{--Ejercicio 7. Implementar una funci´on:
distanciaManhattan:: (Float, Float, Float) ->(Float, Float, Float) ->Float
problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
requiere: {T rue}
asegura : aca no se ve bien
}
Por ejemplo:
distanciaManhattan (2, 3, 4) (7, 3, 8) ⇝ 9
distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) ⇝ 12.8--}

distanciaManhattan :: (Float,Float,Float) -> (Float,Float,Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = resta a d + resta b e + resta c f

resta :: Float -> Float -> Float
resta a b = absoluto (a - b)

absoluto:: Float -> Float
absoluto 0 = 0
absoluto x| x < 0 = -x
          | otherwise = x