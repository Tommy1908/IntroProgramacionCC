########################### Colas ##############################
from queue import Queue as Cola
import random
##################### Funciones Utiles #########################

def generar_cola(longitud: int) -> Cola: #Dado una cantidad de elementos genera una cola
    c = Cola()
    for i in range(0,longitud):
        elemento = input("Ingresar elemento a la cola: ")
        c.put(elemento)
    return c

def descolar(c:Cola) -> None:
    while not(Cola.empty(c)):
        print(c.get())

################################################################

######################## Ejercicio 13 ##########################

def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Cola[int]:
    c = Cola()
    for i in range(0,cantidad):
        n = random.randint(desde,hasta)
        print(n)
        c.put(n)
    return c

################################################################

######################## Ejercicio 14 ##########################

def cantidad_elementos(c:Cola) -> int:
    c_data: list = []
    while not(c.empty()):
        c_data.append(c.get())
    #Ahora c_data tiene los elementos de la cola y ordenados correctamente
    #Ahora devuelvo los elementos a la cola
    for i in range(len(c_data)):
        c.put(c_data[i])
    #Casos vacios
    res:int = 0
    if c_data != []:
        res = len(c_data)
    return res

################################################################

######################## Ejercicio 15 ##########################
#Para este voy a intentar hacerlo sin el duplicador y hacerlo todo en una funcion. No anda si la cola no tiene elementos
def buscar_el_maximo(c:Cola[int]) -> int:
    #Primero desarmo la cola y almaceno sus datos en una lista
    cola_data: list[int] = []
    while not(Cola.empty(c)):
        cola_data.append(c.get())
    print(cola_data)
    #Ahora busco el maximo
    maximo:int = cola_data[0] #Inicializo en el primer valor para evitar problemas si el 0 es mas grande q numeros negativos
    for i in range(len(cola_data)):
        if maximo < cola_data[i]:
            maximo = cola_data[i]
    #Devuelvo la cola a su forma original
    for i in range(len(cola_data)):
        c.put(cola_data[i])
    return maximo


c = generar_nros_al_azar(5,0,20)
print(buscar_el_maximo(c))
descolar(c)

