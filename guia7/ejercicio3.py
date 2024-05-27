#Ejercicio 3. Implementar una funcion para conocer el estado de aprobacion de una materia a partir de las notas obtenidas
#por un/a alumno/a cumpliendo con la siguiente especificacion:

#problema aprobado (in notas: seq⟨Z⟩) : Z {
#    requiere: {|notas| > 0}
#    requiere: {Para todo i ∈ Z si 0 ≤ i < |notas| → 0 ≤ notas[i] ≤ 10)}
#    asegura: {res = 1 ↔ todos los elementos de notas son mayores o iguales a 4 y el promedio es mayor o igual a 7}
#    asegura: {res = 2 ↔ todos los elementos de notas son mayores o iguales a 4 y el promedio esta entre 4 (inclusive) y 7}
#    asegura: {res = 3 ↔ alguno de los elementos de notas es menor a 4 o el promedio es menor a 4}
#}

notas1 = [6,2,3,3] # <- Es de tipo in
notas2 = [5,8,4,5] # <- Es de tipo in
notas3 = [9,7,8,10] # <- Es de tipo in




def problema(notas:list[int]) -> int:
    res:int = 0
    if promedio(notas) < 4 or menorNota(notas) < 4:
        res = 3
    elif promedio(notas) >= 7 and menorNota(notas) >=4:
        res = 1
    else:
        res=2
    return res

def menorNota(notas:list[int]) -> int:
    res:int = notas[0] #inicializa con la primera (notas nunca es vacia)
    for i in range(len(notas)): #La primera comparacion es tautologica pero asi es mas legible el codigo y no hay errores
        if res > notas[i]: #notas[i] es mas chico entonces
            res = notas[i]

    return res

def promedio(notas:list[int]) -> float:
    res:int = 0
    for i in range(len(notas)):
        res += notas[i]
    res = res/len(notas)
    return res

print(notas1)
print(problema(notas1))
print(notas1)

print(notas2)
print(problema(notas2))
print(notas2)

print(notas3)
print(problema(notas3))
print(notas3)
