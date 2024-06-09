######################## Diccionarios ##########################
from queue import LifoQueue as Pila
import typing
##################### Funciones Utiles ######################### 
#Funcion que parte todo un texto en palabras, a partir del 21 pero serviria para el 19
def partir(texto:str,corte:list[str]) -> list[str]: #Toma el texto y en donde hay que cortar
    palabras: list[str] = []
    palabra: str = ""
    for i in range(len(texto)):
        if texto[i] not in corte and texto[i] != '':
            palabra += texto[i]
        elif palabra != '':
            palabras += [palabra]
            palabra = ""
    if palabra not in corte and palabra != '':
        palabras += [palabra]
        palabra = ""
    return  palabras

################################################################

######################## Ejercicio 19 ##########################

#Primero voy a leer el archivo y clasificar cantidades
def agrupar_por_longitud(ruta:str) -> dict:
    archivo = open(ruta)
    contenido: list[list[str]] = archivo.readlines()
    #ahora voy a hacer una lista de todas las palabras
    palabras:list[str] = []
    for i in range(len(contenido)):
        palabra: str = ""
        for k in range(len(contenido[i])):
            if contenido[i][k] != ' ' and contenido[i][k] != '\n':
                palabra += contenido[i][k]

            else:
                if palabra != "":
                    palabras += [palabra]
                palabra = ""

    print(palabras)
    #Ahora los voy a clasificar y meter a un diccionario
    d: dict[int, int] = {}

    for i in range(len(palabras)):
        if len(palabras[i]) not in d:
            d[len(palabras[i])] = 1
        else:
            d[len(palabras[i])] += 1

    return d

################################################################

######################## Ejercicio 20 ##########################
#Voy a copiar la logica para separar los datos

def calcular_promedio_por_estudiante(ruta:str) -> dict[str,float]:
    archivo: typing.IO = open(ruta)
    contenido: list[str] = archivo.readlines()
    #Saco todos los valores que no sean de ese lu de contenido
    contenido_en_lista: list[list[str]] = []
    for i in range(len(contenido)):
        temp:str = ""
        dato: list[str] = []
        for k in range(len(contenido[i])):
            if contenido[i][k] != ',' and k != len(contenido[i])-1:
                temp += contenido[i][k]
            else:
                dato += [temp]
                temp = ""
        contenido_en_lista += [dato]

    #Busco todos los lues
    lues:list[str] = []
    for i in range(len(contenido_en_lista)):
        if contenido_en_lista[i][0] not in lues:
            lues += [contenido_en_lista[i][0]]
    print(lues)

    #Calculo promedio para cada lu, correspondiendo su indice
    promedios:list[float] = []
    for i in range(len(lues)):
        promedio:float = 0
        cantidad:int = 0
        for k in range(len(contenido_en_lista)):
            if contenido_en_lista[k][0] == lues[i]:
                promedio += int(contenido_en_lista[k][3] )
                cantidad += 1
        promedio /= cantidad

        promedios.append(promedio)
    print(promedios)
    #Por ultimo los meto a un diccionario
    d: dict[str,float] = {}
    for i in range(len(lues)):
        d[lues[i]] = promedios[i]
    return d

################################################################

######################## Ejercicio 21 ##########################
#Honestamente nose porque pude que lo haga con un diccionario, creo que me complico mas la vida, pero bueno
def la_palabra_mas_frecuente(ruta: str) -> str:
    #Primero hago un diccionario que contenga todas las palabras y sus cantidades, similar al primero y devuelvo el mayor (sino para que hago)
    archivo: typing.IO = open("ejercicio21.txt")
    contenido:str = archivo.read()
    contenido = (contenido.lower())

    #Voy a hacer una funcion slice mas general (va a estar arriba de todo)
    palabras: list[str] = partir(contenido,[',',' ','\n','(',')'])

    #Ahora los meto en un diccionario clasificados por su cantidad, pero aca la clave va a ser la palabra y su valor la cantidad de apariciones
    d: dict[str,int] = {}
    for i in range(len(palabras)):
        if palabras[i] in d:
            d[palabras[i]] += 1
        else:
            d[palabras[i]] = 1

    #Ahora devuelvo la palabra con mas apariciones
    key:str = ""
    value:int = 0

    for k,v in d.items():
        #print(f"key -> {k}, value -> {v}")
        #print(f"{k}: {v}")
        if value < v:
            value = v
            key = k

    #print(f"\nLa palabra con mas apariciones es {key}: {value}")

    return key

################################################################

######################## Ejercicio 22 ##########################
#Bueno estaba media rara la espeficicacion pero entiendo que cuando vas para atras, te suma al historial el anterior
#Si era youtube -> facebook -> google -> campus y pongo ir atras es youtube -> facebook -> google -> campus -> google y si lo pongo devuelta es campus
#Voy a hacerlo en base a eso

#Voy a hacer una funcion que me permita ver la pila y devolverla como estaba
def desapilar(p:Pila[str]) -> Pila[str]:
    data: list[str] = []
    while not Pila.empty(p):
        data.append(p.get())
    print(data)
    for i in range(len(data)-1,-1,-1):
        p.put(data[i])
    return p

historial: dict[str, Pila[str]] = {}

def visitar_sitio(historial:dict[str, Pila[str]], usuario:str, sitio:str) -> None:
    #Primero veo si ya existe un historial de ese usuario, sino lo creo
    if usuario not in historial:
        p = Pila()
        p.put(sitio)
        historial[usuario] = p
        #p = desapilar(p)
    else:
        for k,v in historial.items():
            if k == usuario:
                v.put(sitio) #Este v es la pila (historial)
                #v = desapilar(v)

#Asumo que hay algun elemento anterior en la pila ya que no aclara que hacer en ese caso
def navegar_atras(historial:dict[str, Pila[str]], usuario:str) -> None:
    actual:str = ""
    anterior:str = ""
    #Busco en el historial
    p = historial[usuario]
    actual = p.get()
    anterior = p.get()
    #Devuelvo el historial
    p.put(anterior)
    p.put(actual)
    #Agrego el anterior
    visitar_sitio(historial,usuario,anterior)

#Prueba:
#visitar_sitio(historial,"Tommy","google.com")
#visitar_sitio(historial,"Tommy","youtube.com")
#visitar_sitio(historial,"User2","google.com")
#visitar_sitio(historial,"User2","instagram.com")
#visitar_sitio(historial,"Admin","gitHub.com")
#visitar_sitio(historial,"Admin","youtube.com")
#navegar_atras(historial,"Admin")
#visitar_sitio(historial,"Tommy","discord.com")
#visitar_sitio(historial,"User2","google.com")
#navegar_atras(historial,"Tommy")
#navegar_atras(historial,"Tommy")
#navegar_atras(historial,"Tommy")
#visitar_sitio(historial,"User2","google.com")
#navegar_atras(historial,"User2")
#
#for k,v in historial.items():
#    print(f"Historial de {k}: ")
#    desapilar(v)

################################################################

######################## Ejercicio 23 ##########################
#Creo que puse mal el tipo y era float y no string el precio, funciona igual
inventario: dict[str,dict[str,int]] = {}

#Dice que el elemento a agregar no esta en inventario
def agregar_producto(inventario:dict[str,dict[str,int]],nombre:str,precio:int,cantidad:int) -> None:
    data: dict[str,int] = {}
    data["precio"] = precio
    data["cantidad"] = cantidad
    inventario[nombre] = data


#Aca no aclara pero entocnes asumo que ese elemento existe ya en el dicc
def actualizar_stock(inventario:dict[str,dict[str,int]],nombre:str,cantidad:int) -> None:
    data: dict[str,int] = inventario[nombre]
    data["cantidad"] = cantidad
    inventario[nombre] = data

#Lo mismo que antes, asumo que el producto ya esta en el inventario
def actualizar_precios(inventario:dict[str,dict[str,int]],nombre:str,precio:int) -> None:
    data: dict[str,int] = inventario[nombre]
    data["precio"] = precio
    inventario[nombre] = data

def calcular_valor_inventario(inventario:dict[str,dict[str,int]]) -> float:
    valor:float = 0.0
    for k,v in inventario.items():
        data: dict[str,int] = inventario[k]
        valor += (data["precio"] * data["cantidad"])

    return valor

#Ejemplo
#agregar_producto(inventario,"Jeans",5600,7)
#agregar_producto(inventario,"Camisa",4900,19)
#agregar_producto(inventario,"Saco",6000,4)
#print(inventario)
#print(calcular_valor_inventario(inventario))
#actualizar_precios(inventario,"Camisa",5000)
#actualizar_stock(inventario,"Jeans",4)
#actualizar_stock(inventario,"Saco",12)
#actualizar_precios(inventario,"Saco",5800)
#print(inventario)
#print(calcular_valor_inventario(inventario))


################################################################