#Ejercicio 1

def leer_lineas(archivo)-> list[str]:
    archivo = open("ejercicio1.txt")
    lineas = archivo.readlines()
    archivo.close()
    return lineas

def leer(archivo) -> str:
    archivo = open("ejercicio1.txt")
    contenido = archivo.read()
    archivo.close()
    return contenido

#1) Una funcion contar lineas(in nombre archivo : str) → int que cuenta y devuelva la cantidad de lineas de texto del archivo dado.

def contar_lineas(archivo:str) -> int:
    lineas:list[str] = leer_lineas(archivo)
    return len(lineas)

#print(contar_lineas("ejercicio1.txt"))

#2) Una funcion existe palabra(in palabra : str, in nombre archivo : str) → bool que dice si una palabra existe en un archivo de texto o no

def existe_palabra(palabra:str,archivo:str) -> bool:
    contenido:str = leer(archivo)
    res:bool = False

    if contenido.count(palabra) > 0:
        res = True

    return res

print(existe_palabra("es","ejercicio1.txt"))
#Cualquier aparicion de la palabra, incluso dentro de otra es contada.

#3)Una funcion cantidad apariciones(in nombre archivo : str, in palabra : str) → int 
#que devuelve la cantidad de apariciones de una palabra en un archivo de texto

def cantidad_de_apariciones(palabra:str,archivo:str) -> int:
    contenido:str = leer(archivo)

    return contenido.count(palabra)

print(cantidad_de_apariciones("es","ejercicio1.txt"))

