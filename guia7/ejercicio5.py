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

s = [1,2,3,7,7,2,9,7]
e = 7
res = []
print(f"{s},{e},{res}")

def pertenece_a_cada_uno_version_1(s:list[int],e:int,res:list[bool]) -> None:
    
    for i in range(len(s)):
        if pertenece([s[i]], e):
            res.append(True)
        else:
            res.append(False)

print(pertenece_a_cada_uno_version_1(s,e,res))

print(f"{s},{e},{res}")