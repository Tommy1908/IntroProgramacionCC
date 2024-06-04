######################## Diccionarios ##########################
from queue import LifoQueue as Pila
import random
import typing
##################### Funciones Utiles ######################### 

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

    print(d.items())

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

print(calcular_promedio_por_estudiante("ejercicio20.csv"))