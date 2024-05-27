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

#7) 
hasLower:bool = False
hasUpper:bool = False
hasNumber:bool = False

def password(password:str) -> str:
    res:str = "AMARILLA"
    checkContent(password)
    if len(password) < 5:
        res = "ROJA"
    elif len(password) > 8 and hasLower and hasUpper and hasNumber:
        res = "VERDE"
    return res

def checkContent(password:str) -> None:
    global hasLower
    global hasUpper
    global hasNumber
    for i in range(len(password)):
        if 97 <= ord(password[i]) <= 122:
            hasLower = True
        elif 65 <= ord(password[i]) <= 90:
            hasUpper = True
        elif 48 <= ord(password[i]) <= 57:
            hasNumber = True

#8)
#Dada una lista de tuplas, que representa un historial de movimientos en una cuenta bancaria, devolver el saldo actual.
#Asumir que el saldo inicial es 0. Las tuplas tienen una letra que nos indica el tipo de movimiento “I” para ingreso de
#dinero y “R” para retiro de dinero, y ademas el monto de cada operacion. Por ejemplo, si la lista de tuplas es [(‘‘I’’, 2000), (‘‘R’’, 20),(‘‘R’’, 1000),(‘‘I’’, 300)]
#entonces el saldo actual es 1280.

#def banco(mov:list[tuple:(chr,int)]) -> int:
#ni idea como usar una tupla


#9)
#Voy a usar append y count que estan en las slides teoricas
def tres_vocales_diferentes(p:str) -> bool:
    res:bool = False
    vocales_encontradas:list = []
    vocales = ['a','e','i','o','u']
    #Recorro la palabra en busca de vocales
    for i in range(len(p)):
        if (p.count(p[i]) != 0) and (p[i] in vocales):
            vocales_encontradas.append(p[i]) #Lista de vocales encontradas

    quitar_repetidos(vocales_encontradas)

    if len(vocales_encontradas) >= 3:
        res = True

    return res

def quitar_repetidos(l:list) -> list:
    res:list = []
    for i in range(len(l)):
        if res.count(l[i]) == 0:
            res.append(l[i])
    return res