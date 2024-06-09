"""
Índice de la n-ésima aparición [2 puntos]
Implementar la función ind_nesima_aparicion que dada una secuencia de enteros s, y dos enteros n y elem devuelve la posición en la cual elem aparece por n-ésima vez en s. En caso de que elem aparezca menos de n veces en s, devolver -1.

problema ind_nesima_aparicion (in s: seq⟨Z⟩, in n: Z, in elem: Z) : Z {
  requiere: {n>0}
  asegura: {Si el elemento aparece menos de n veces en la secuencia, res= -1 }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, s[res] = elem }
  asegura: {Si el elemento aparece al menos n veces en la secuencia, elem aparece n-1 veces en s entre las posiciones 0 y res-1 }

Por ejemplo, dadas
s = [-1, 1, 1, 5, -7, 1, 3]
n = 2
elem = 1
se debería devolver res = 2
"""

def ind_nesima_aparicion(s: list[int], n:int, elem:int) -> int:
    res: int = -1
    apariciones:int = 0
    for i in range(len(s)):
        if s[i] == elem:
            apariciones += 1
        if apariciones == n and res == -1:
            res = i

    return res
"""
2) Mezclar [2 puntos]
Implementar la función mezclar que dadas dos listas s1 y s2 con igual cantidad de elementos devuelva una lista con los elementos intercalados. Esto es, las posiciones pares de res tendrán los elementos de s1 y las posiciones impares los elementos de s2, respetando el orden original.
problema mezclar (in s1: seq⟨Z⟩, in s2: seq⟨Z⟩) : seq⟨Z⟩ {
  requiere: {|s1| = |s2| }
  asegura: {|res| = 2 * |s1|}
  asegura: {res[2*i] = s1[i] y res[2*i+1] = s2[i], para i entre 0 y |s1|-1}
TIP: realizar la iteración mediante índices y no mediante elementos

Por ejemplo, dadas
s1 = [1, 3, 0, 1]
s2 = [4, 0, 2, 3]
se debería devolver res = [1, 4, 3, 0, 0, 2, 1, 3]
"""
#S1 PARES, S2 IMPARES
def mezclar(s1:list[int],s2:list[int]) -> list[int]:
    res:list[int] = []
    #|s1|=|s2|
    for i in range(len(s1)):
        res.append(s1[i])
        res.append(s2[i])
    
    return res

"""
Matriz capicúa [3 puntos]
Implementar la función matriz_capicua que dada una matriz devuelve True si cada una de sus filas es capicúa. Es decir, si cada fila es igual leída de izquierda a derecha o de derecha a izquierda. Definimos a una secuencia de secuencias como matriz si todos los elemento de la primera secuencia tienen la misma longitud.

problema matriz_capicua(in m:seq⟨seq⟨Z⟩⟩ ) : Bool {
  requiere: {todos los elementos de m tienen igual longitud (los elementos de m son secuencias)}
  asegura: {(res = true) <=> todos los elementos de m son capicúa}

Por ejemplo, dada la matriz
m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
se debería devolver res = trued
"""

def matriz_capicua(m: list[list[int]]) -> bool:
    res:bool = True
    for i in range(len(m)):
        res = es_capicua(m[i])
    return res

def es_capicua(l:list[int]) -> bool:
    res: bool = True
    k:int = len(l)-1
    for i in range(len(l)):
        if l[i] != l[k]:
            res = False 
        k -= 1

    return res

print(matriz_capicua([[8,5,3,5,8],[],[1,2,2,1],[3,6,3],[8],[0,6]]))