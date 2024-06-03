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

################################################################

######################### Ejercicio 4 ##########################

def agregar_frase_final(ruta: str, frase: str) -> None:
    archivo:typing.IO = open(ruta,'a')
    archivo.write("\n" + frase)
    archivo.close()
#Con esta implementacion siempre queda un salto de linea en la primera, poniendolo despues quedaria al final. Creo que si lo abriera en modo lectura y escritura}
#Podria evitarlo verificando si esta vacio, no haga este salto de linea. Pero asi queda mas simple y usamos 'a'

################################################################

######################### Ejercicio 5 ##########################

def agregar_frase_al_principio(ruta: str, frase: str) -> None:
    archivo: typing.IO = open(ruta, 'r')
    lineas: list[str] = archivo.readlines()
    archivo.close()

    lineas = [frase + '\n'] + lineas

    archivo = open(ruta, 'w')

    for i in range(len(lineas)):
        archivo.write(lineas[i])

################################################################

######################### Ejercicio 6 ##########################
#Devolver elementos que:
    #secuencias de texto formadas por numeros, letras mayusculas/minusculas y los caracteres ‘ ’(espacio) y ‘ ’(guion bajo)
    #que tienen longitud >= 5
 #  chr(byte)
def listar_palabras_de_archivo(ruta: str) -> list[str]:
    archivo = open(ruta,'rb')
    contenido = archivo.read()
    
    res: list[str] = []
    palabra:str = ""

    for i in range(len(contenido)):
        byte = chr(contenido[i]) #Ya traducido
        #print(chr(contenido[i]))
        if (48 <= ord(byte) <= 57) or  (65 <= ord(byte) <= 90) or (97 <= ord(byte) <= 122) or (byte == " ") or (byte == "_"):
            palabra += byte
        else:
            if len(palabra) >= 5:
                res += [palabra]
                palabra = ""
            else:
                palabra = ""
    #Pasamos esta condicion una ves mas por si quedo una palabra al final del for
    if len(palabra) >= 5:
        res += [palabra]
        palabra = ""
    else:
        palabra = ""
    return res

################################################################

######################### Ejercicio 7 ##########################

def promedio_estudiante(ruta:str,lu:str) -> float:
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

    #Ahora busco para ese LU las notas
    promedio:float = 0
    cantidad:int = 0
    for i in range(len(contenido_en_lista)):
        if contenido_en_lista[i][0] == lu:
            promedio += int(contenido_en_lista[i][3] )
            cantidad += 1
    promedio /= cantidad
    return promedio

def calcular_promedio_por_estudiante(ruta:str,promedios:str) -> None:
    archivo_res: typing.IO = open(promedios, 'a')
    
    #Ahora voy a repetir el codigo de arriba para ver cuantos lu's tengo, seria mejor hacerlo solo una y no repetir codigo
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
    #Hago una lista con los lu's
    lues:list[str] = []
    for i in range(len(contenido_en_lista)):
        if contenido_en_lista[i][0] not in lues:
            lues += [contenido_en_lista[i][0]]

    #Ahora por cada lu pasamos a la funcion anterior y lo escribimos
    for i in range(len(lues)):
        promedio:int = promedio_estudiante(ruta,lues[i])
        archivo_res.write(f"{lues[i]},{promedio}\n")