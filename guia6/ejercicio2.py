from math import *


#1)

def imprimir_saludo(nombre:str) -> None:
    print("Hola " + nombre)
    return None

#2)

def raiz_cuadrada_de(numero:float) -> float:
    return sqrt(numero)

#3)

def fahrenheit_a_celsius(t:float) -> float:
    return ((t-32)*5)/9

#4)

def imprimir_dos_veces(estribillo:str) -> None:
    print((estribillo + "\n")*2) #Queda un enter de mas
    
#5)

def es_multiplo_de(n:float,m:float) -> bool:
    if(n % m == 0):
        return True
    else:
        return False
    
#6)

def es_par(numero:float) -> bool:
    if (es_multiplo_de(numero,2)):
        return True
    else:
        return False
    
#7)

def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int) -> int:
    cant_de_porciones = comensales * min_cant_de_porciones
    return ceil(cant_de_porciones / 8)
