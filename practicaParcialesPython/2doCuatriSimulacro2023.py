# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
# se debería devolver res=7

# e in s por requiere
def ultima_aparicion(s: list[int], e: int) -> int:
    res:int = -1
    for i in range(len(s)):
        if s[i] == e:
            res = i
            print(res)

    return res

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

def elementos_exclusivos(s: list[int], t: list[int]) -> list[int]:
    res:list[int] = []

    for i in range(len(s)):
        if s[i] not in t:
            res.append(s[i])
            print(res)

    for i in range(len(t)):
        if t[i] not in s:
            res.append(t[i])
            print(res)
    
    return res


# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

ding = {"hola":"hello","mundo":"world","programa":"program","tanque":"tank","verde":"green","dif":"a"}
dale = {"hola":"ALO","mundo":"world","programa":"program","tanque":"tank","diferente":"a"}

def contar_traducciones_iguales(ding: dict[str,str], dale: dict[str,str]) -> int:
    res:int = 0
    valores_ingles: list[str] = []
    for k,v in ding.items():
        if k in dale:
            if ding[k] == dale[k]:
                res += 1

    return res

print(contar_traducciones_iguales(ding,dale))

# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

def convertir_a_diccionario(lista: list[int]) -> dict[int,int]:
    d: dict[int,int] = {}
    for i in range(len(lista)):
        if lista[i] in d:
            d[lista[i]] += 1
        else:
            d[lista[i]] = 1

    return d

print(convertir_a_diccionario([1,2,3,4,1,3,4,6,7]))