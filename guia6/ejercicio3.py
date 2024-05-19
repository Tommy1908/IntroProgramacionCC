from math import *

#Resuelva los siguientes ejercicios utilizando los operadores lógicos and, or, not. Resolverlos sin utilizar alternativa condicional (if)

def alguno_es_0(n1:float,n2:float) -> bool:
    return (n1==0 or n2 ==0)

def ambos_son_0(x:float,y:float) -> bool:
    return (x==0 and y==0)

def es_nombre_largo(nombre:str) -> bool:
    longitud = len(nombre)
    return 3 <= longitud <= 8 

def es_bisiesto(año:int) -> bool:
    mod400 = (año % 400) == 0 
    mod4 = (año % 4) == 0 
    mod100 = (año % 100) == 0 
    return (mod400) or (mod4 and not mod100)