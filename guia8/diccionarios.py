######################## Diccionarios ##########################
from queue import LifoQueue as Pila
import random
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


agrupar_por_longitud("ejercicio19.txt")

