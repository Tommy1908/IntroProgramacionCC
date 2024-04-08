--1)a)f,f2 son iguales, f usa pattern Matching y f2 Guardas
f:: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

f2:: Int -> Int
f2 n|n == 1 = 8
    |n == 4 = 131
    |n == 16 = 16

--b)
g:: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1 

--c) h = fog, k = gof
h:: Int -> Int
h x = f(g x)

k:: Int -> Int
k x = g(f x)
