#Ejercicio 1

#1) Pertenece (Hacer 3 formas distintas)

def pertenece1(s:list[int],e:int) -> bool:
    return e in s



def pertenece2(s:list[int],e:int) -> bool:
    res:bool = False
    for i in range((len(s))):
        if s[i] == e:
            res = True
    return res



def pertenece3(s:list[int],e:int) -> bool:
    return s.count(e) > 0

    

def pertenece4(s:list[int],e:int) -> bool:
    res:bool = False
    while s != []:
        if e == s.pop(0):
            res = True

    return res    



#2) Divide a todos
# e not 0
def divideATodos(s:list[int], e:int) -> bool:
    res:bool = True
    for i in range(len(s)):
        if ((s[i]) % e) != 0:
            res = False
    return res

#3) sumaTotal

def sumaTotal(s:list[int]) -> bool:
    res:int = 0
    for i in range(len(s)):
        res += s[i]
    return res

#4) ordenados

def ordenados(s:list[int]) -> bool:
    res:bool = True
    for i in range(len(s)):
        if(i < len(s)-1):
            if(s[i] >= s[i+1]):
                res = False
    return res

#5) Dada una lista de palabras, devolver verdadero si alguna palabra tiene longitud mayor a 7

def palabrasLargas(l:list[str]) -> bool:
    res:bool = False
    for i in range(len(l)):
        if len(l[i]) > 7:
            res = True
    return res

#6) Dado un texto en formato string, devolver verdadero si es palindromo (se lee igual en ambos sentidos), falso en caso contrario
#Seria como ver si es capicua. No tengo en cuenta las mayusculas o minusculas, no se si es necesario
def esPalindromo(palabra:str) -> bool:
    res:bool = False
    for i in range(len(palabra)):
        if palabra == reverso(palabra):
            res = True
    return res

def reverso(palabra:str) -> str:
    res:str = ""

    for i in range(len(palabra)):
        res = palabra[i] + res

    return res

