#Ejercicio 4

#1)
#problema pertenece a cada uno version 1 (in s:seq⟨seq⟨Z⟩⟩, in e:Z, out res: seq⟨Bool⟩) {
#    requiere: { True }
#    asegura: { |res| ≥ |s|}
#    asegura: { Para todo i ∈ Z si 0 ≤ i < |s| → (res[i] = true ↔ pertenece(s[i], e))}
#}
#Nota: Reutilizar la funcion pertenece() implementada previamente para listas.

def pertenece(s:list[int],e:int) -> bool:
    res:bool = False
    for i in range((len(s))):
        if s[i] == e:
            res = True
    return res

#medio rara la funcion

#s = [1,2,3,7,7,2,9,7]
#e = 7
#res = []
#print(f"{s},{e},{res}")

def pertenece_a_cada_uno_version_1(s:list[int],e:int,res:list[bool]) -> None:
    for i in range(len(s)):
        if pertenece([s[i]], e):
            res.append(True)
        else:
            res.append(False)

#pertenece_a_cada_uno_version_1(s,e,res)

#rint(f"{s},{e},{res}")

#2)
#problema pertenece a cada uno version 2 (in s:seq⟨seq⟨Z⟩⟩, in e:Z, out res: seq⟨Bool⟩) {
#    requiere: { True }
#    asegura: {|res| = |s|}
#    asegura: { Para todo i ∈ Z si 0 ≤ i < |s| → (res[i] = true ↔ pertenece(s[i], e))}
#}

#def pertenece_a_cada_uno_version_2(s:list[int],e:int,res:list[bool]) -> None:

""""El codigo es lo mismo al final, la diferencia es que es en el 1 es >= y aca en el segundo es =, por lo tanto el segundo es mas restrictivo"""

#3)
#problema es matriz (in s:seq⟨seq⟨Z⟩⟩) : Bool {
#    requiere: { True }
#    asegura: { res = true ↔ (|s| > 0) ∧ (|s[0]| > 0) ∧ (Para todo i ∈ Z si 0 ≤ i < |s| → |s[i]| = |s[0]|)}
#}

mat1 = [[1,2,3],[1,2],[2,6,8]]
mat2 = [[1,2,3,4],[3,5,7,9],[1,3,6,7]]
mat3 = [[],[1],[1],[3]]

print(f"{mat1}\n{mat2}\n{mat3}\n")

def es_matriz(s:list[list[int]]) -> bool:
    
    res:bool = False
    if len(s) > 0 and len(s[0]) > 0:
        res = True

    
    for i in range(len(s)):
        if res == True:
            res = len(s[i]) == len(s[0])
            
    return res

print(es_matriz(mat1))
print(es_matriz(mat2))
print(es_matriz(mat3))


print(f"{mat1}\n{mat2}\n{mat3}\n")
