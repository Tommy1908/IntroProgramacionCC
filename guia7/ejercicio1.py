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


print(ordenados([1,2,3,4,5]))
print(ordenados([1,2,6,9]))
print(ordenados([1,2,3,3,5]))
print(ordenados([6,7,1,0]))
print(ordenados([1,2,3,23]))

