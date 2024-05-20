j : int = 8

def sumaTotal (s:list [int]) -> int:
    acum: int = 0
    i: int = 0
    while i < len(s):
        acum += s[i]
        i+=1
    return acum

sumaTotal([5,3,2])