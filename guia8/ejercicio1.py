########################### Archivos ###########################
import typing

#def rel(): exec(f"import {__name__};import importlib;importlib.reload({__name__})")
#r = f"rel(); from {__name__} import *"
#print("OK. Reload with exec(r)")

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

################################################################
#Este y el 3 tenian especificacion raraza, y no muy claro que tomar como "palabra", (entre espacios? y si tiene signos?, etc)
#2)
def existe_palabra(palabra:str,archivo:str) -> bool:
    contenido:str = leer(archivo)
    res:bool = False

    if contenido.count(palabra) > 0:
        res = True

    return res
#Cualquier aparicion de la palabra, incluso dentro de otra es contada. (Ej, da 4 si el la palabra "es" y el texto es "estaba comes es mesa")

################################################################
#3)
def cantidad_de_apariciones(palabra:str,archivo:str) -> int:
    contenido:str = leer(archivo)

    return contenido.count(palabra)

################################################################

######################### Ejercicio 2 ##########################

def clonar(ruta:str) -> None:
    lineas:list[str] = leer_lineas(ruta)
    res = open("ejercicio2res.txt",'w')
    for i in range(len(lineas)):
        caracter:chr = ''
        recorrido:int = 0
        while caracter != '#' and recorrido <= len(lineas[i])-1:
            caracter = lineas[i][recorrido]
            recorrido += 1
        if not(caracter == '#'):
            res.write(lineas[i])

################################################################

######################### Ejercicio 3 ##########################

def invertir(ruta:str) -> None:

    lineas: list[str] = leer_lineas(ruta)
    res: typing.IO = open("reverso.txt",'w')

    #Convierto los strings a listas
    listedLines:list[list[str]] = []
    for i in range(len(lineas)):
        listedLines.append(list(lineas[i]))

    #lineas[len(lineas)-1] += "\n"
    if(listedLines != []):
        listedLines[0].pop(len(listedLines[0])-1) #Saca el salto de linea del primero
        listedLines[len(listedLines)-1].append('\n')#Agrega salto de linea al ultimo

    #Devuelvo a su estado de string el contenido de las listas
    lineas.clear()
    for i in range(len(listedLines)):
        line:str = ""
        for k in range(len(listedLines[i])):
            line += listedLines[i][k]
        lineas.append(line)
        print((lineas[i]))
    print(lineas)

    #Las invierto
    for i in range(len(lineas)-1,-1,-1):
        res.write(lineas[i])

invertir("ejercicio3.txt")

################################################################

######################### Ejercicio 4 ##########################