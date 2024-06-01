########################### Pilas ##############################
from queue import LifoQueue as Pila
import random
##################### Funciones Utiles ######################### 

def desapilar(p: Pila[int]) -> None: #Imprime la pila y su longitud al final
    long: int = 0
    print("Desapilando:")
    while not(Pila.empty(p)):
        print(p.get())
        long += 1
    print(f"Longitud final de la pila: {long}")

def apilar(longitud:int) -> Pila[int]: #Ingresar solo ints para no romper no probe str, dado un int de longitud para esa pila podes ingresar elementos
    p = Pila()
    for i in range(0,longitud):
        elemento:str = input("Añadir elemento a la pila o terminar(x): ") #Realmente cualquier otra cosa que no sea un numero (inicialemente es un str luego int)
        p.put(elemento)
    return p

#Duplicar pila, desarma la pila, la copia en una lista y devuelve esa pila a su estado original y crea una nueva que puede ser trabajada luego
def duplicar_Pila(p: Pila) -> Pila:
    pila_datos: list = []
    duplicado: Pila = Pila()
    while not(Pila.empty(p)):
        pila_datos.append(p.get()) #En la lista queda la pila con el primer valor el ultimo entrar a la pila (el de mas arriba) y ultimo el de mas abajo
    #restaruo P y lleno el duplicado
    for i in range(len(pila_datos)-1,-1,-1): #Recorre la lista al reves
        p.put(pila_datos[i])
        duplicado.put([pila_datos[i]])
    #devuelvo un duplicado
    return duplicado

################################################################

######################### Ejercicio 8 ##########################

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]: #Falta acalrar el tipo de salida
    p = Pila()
    for i in range(0,cantidad):
        n = random.randint(desde,hasta)
        p.put(n)
    return p

################################################################

######################### Ejercicio 9 ##########################

def cantidad_elementos(p: Pila[int]) -> int: #Este tiene que dejar a p como estaba inicialmente
    duplicado: Pila[int] = duplicar_Pila(p)
    long:int = 0
    while not(Pila.empty(duplicado)): #Aca desarmamos el duplicado
        long += 1
    return long

################################################################

######################### Ejercicio 10 #########################

def buscar_el_maximo(p: Pila[int]) -> int:
    duplicado: Pila = duplicar_Pila(p)
    maximo:list[str] = duplicado.get() #No entiendo porque
    maximo = int(maximo[0]) #lo paso a numero
    while not(Pila.empty(duplicado)):
        evaluado: int = int((duplicado.get())[0])
        if maximo < evaluado:
            maximo = evaluado 
        #Maximo esta en clase lista
    return maximo

################################################################

######################### Ejercicio 11 #########################

def esta_bien_balanceada(s:str) -> bool: #Necesito usar pilas realmente?? | No aclara que hacer si se pone una letra por ejemplo, asi que saltee esa parte, funciona igual
    p = Pila()
    for i in range(len(s)-1,-1,-1): #La doy vuelta asi cuando la apile me queda como si fuera de izquerda a derecha (podria ser igual pero hay que cambiar la logica de los if's)
        if s[i] == "(" or s[i] == ")":
            p.put(s[i])
    #Ahora p tiene tiene todos los parentersis
    #Por cada abierto tengo que encontrar uno que lo cierre, y es importante que siempre haya primero uno habierto para cerrarlo
    abiertos:int = 0
    cerrados:int = 0
    balanceado:bool = True
    while not(Pila.empty(p)) and balanceado:
        elemento:str = p.get()
        if elemento == '(':
            abiertos += 1
        else:
            cerrados += 1
        if cerrados > abiertos:
            balanceado = False
    if abiertos != cerrados:
        balanceado = False
    return balanceado

