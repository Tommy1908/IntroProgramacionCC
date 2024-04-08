maximo3:: Int -> Int -> Int -> Int
maximo3 x y z| x >= y && x >= z = x
             | y >= x && y >= z = y
             | z >= x && z >= y = z
