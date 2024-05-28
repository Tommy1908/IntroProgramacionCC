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

def es_matriz(s:list[list[int]]) -> bool:
    
    res:bool = False
    if len(s) > 0 and len(s[0]) > 0:
        res = True

    
    for i in range(len(s)):
        if res == True:
            res = len(s[i]) == len(s[0])

    return res

#4)
#problema filas ordenadas (in m:seq⟨seq⟨Z⟩⟩, out res: seq⟨Bool⟩) {
#    requiere: { es Matriz(m)}
#    asegura: { Para todo i ∈ Z si 0 ≤ i < |res| → (res[i] = true ↔ ordenados(s[i])) }
#}

def ordenados(s:list[int]) -> bool:
    res:bool = True
    for i in range(len(s)):
        if(i < len(s)-1):
            if(s[i] >= s[i+1]):
                res = False
    return res

def filas_ordenadas(m:list[list[int]],res:list[bool]):
    res.clear()
    for i in range(len(m)):
        res.append(ordenados(m[i]))

