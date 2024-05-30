########################### Archivos ###########################
import typing

def rel(): exec(f"import {__name__};import importlib;importlib.reload({__name__})")
r = f"rel(); from {__name__} import *"
print("OK. Reload with exec(r)")

##################### Funciones Utiles ######################### 

def leer_lineas(ruta)-> list[str]: #Devuelve una lista con cada linea por elemento
    archivo: typing.IO = open(ruta)
    lineas: list[str] = archivo.readlines()
    archivo.close()
    return lineas

def leer(ruta) -> str: #Devuelve todo el contenido del archivo en string
    archivo: typing.IO = open(ruta)
    contenido: str = archivo.read()
    archivo.close()
    return contenido

################################################################

######################### Ejercicio 1 ##########################


#1)
def contar_lineas(ruta:str) -> int:
    lineas:list[str] = leer_lineas(ruta)
    return len(lineas)

def contar_lineas_alternativo(ruta:str) -> int:
    contenido = leer(ruta)
    res:int = 1 #Empieza en 1 porque siempre hay por lo menos 1 linea
    for i in range(len(contenido)):
        if contenido[i] == '\n':
            res += 1
    return res

#2) #Voy a considerar palabra todo aquello que este separado de otro caracter no vacio o un salto de linea
def existe_palabra(palabra:str,ruta:str) -> bool:
    contenido = leer(ruta)
    enPalabra:bool = False
    palabras:list[str] = []

    #for i in range(1,len(contenido)-1):
    #    if contenido[i] != ' ':
