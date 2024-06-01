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

################################################################

######################## Ejercicio 16 ##########################
#Entiendo que los numeros no se pueden repetir
def armar_secuencia_de_bingo() -> Cola[int]:
    #Primero voy a armar una lista asi es mas comodo verificar que no haya repetidos
    numeros_para_bingo: list[int] = []
    while not(len(numeros_para_bingo) == 12):
        n:int = random.randint(0,99) #Esos son los posibles valores del bingo
        if n not in numeros_para_bingo: #Aca uso in en vez de un pertenece porque no lo tengo aca
            numeros_para_bingo.append(n)
    #Ahora ya tenemos todos los valores para el bingo, los metemos a una cola
    c = Cola()
    for i in range(0,12):
        c.put(numeros_para_bingo[i])
    print(numeros_para_bingo)
    return c

#def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:

################################################################

######################## Ejercicio 17 ##########################
#Voy a hacer esto para poner colas para probar el codigo
def lista_pacientes_a_cola(l:list[(int,str,str)]) -> Cola[(int,str,str)]: 
    c = Cola()
    for i in range(len(l)):
        c.put(l[i])
    return c

def n_pacientes_urgentes(c: Cola[(int,str,str)]) -> int:  #Hay q devolver pacientes que ntengan el int con rango [1,3]
    #Desarmo la cola y leo los datos
    pacientes_datos: list[(int,str,str)] = []
    pacientes_urgentes: int = 0

    while not(Cola.empty(c)):
        pacientes_datos.append(c.get())
    print(pacientes_datos)
    #Armo devuelta la cola y aprovecho el mismo for para ver cuantos pacientes estan entre 1 y 3
    for i in range(len(pacientes_datos)):
        #Armar cola
        c.put(pacientes_datos[i])
        #Ver pacientes
        if pacientes_datos[i][0] <= 3: #aca asumo que los valores siempre son entre el 1 y el 10
            pacientes_urgentes += 1
    
    return pacientes_urgentes

################################################################

######################## Ejercicio 18 ##########################

#requiere = true
#asegura = Si no hay personas devuelve la cola vacia
#asegura = La cola devuelta tiene a todos las personas en la cola dada segun el orden de entrada a la cola (primero los primeros) en 3 grupos,
#prioritarios, preferencial y el resto, cada subgrupo con su orden de entrada a la cola

#Primero voy a hacer lo mismo que antes y que dada una lista armar una cola para probar el codigo luego
def lista_clientes_a_cola(l:list[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)]: 
    c = Cola()
    for i in range(len(l)):
        c.put(l[i])
    return c
#Otra opcion podria ser armar listas diferentes y asignarles un valor general de llegada
def atencion_a_clientes(c: Cola[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)]:
    #Desarmemos la cola en una lista
    cola_datos: list[(str,int,bool,bool)] = []
    while not(Cola.empty(c)):
        cola_datos.append(c.get()) #El orden de llegada es correspondiente a su index
    print(cola_datos)

    #Armamos la cola devuelta
    for i in range(len(cola_datos)):
        c.put(cola_datos[i])

    #Ahora creamos una nueva cola para devolver(la inicial es de tipo in) y vemos el orden. Metemos primero en la lista para ver que no haya repetidos
    res = Cola()
    res_lista: list[(str,int,bool,bool)] = []

    for i in range(len(cola_datos)):
        if cola_datos[i][3] == True:
            res_lista.append(cola_datos[i])

    for i in range(len(cola_datos)):
        if (cola_datos[i][2] == True ) and (cola_datos[i] not in res_lista): #Usar un pertenece si no se puede usar in
            res_lista.append(cola_datos[i])
            
    for i in range(len(cola_datos)):
        if cola_datos[i] not in res_lista:
            res_lista.append(cola_datos[i])

    #Por ultimo metemos estos datos finales a la cola
    for i in range(len(res_lista)):
        res.put(res_lista[i])
            
    return res

################################################################