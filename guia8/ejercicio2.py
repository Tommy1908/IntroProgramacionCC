import typing
#Ejercicio 2. Dado un archivo de texto con comentarios, implementar una funcion clonar sin comentarios(in nombre archivo : str)
#que toma un archivo de entrada y genera un nuevo archivo que tiene el contenido original sin las lineas comentadas.
#Para este ejercicio vamos a considerar comentarios como aquellas lineas que tienen un caracter ‘#’como primer car´acter de la linea
#o si no es el primer caracter, se cumple que todos los anteriores son espacios.

def leer_lineas(ruta)-> list[str]:
    archivo: typing.IO = open(ruta)
    lineas: list[str] = archivo.readlines()
    archivo.close()
    return lineas

def contar_lineas(ruta:str) -> int:
    lineas: list[str] = leer_lineas(ruta)
    return len(lineas)

def sin_comentarios(ruta: str) -> None:
    lineas: int = contar_lineas(ruta)
    archivo: typing.IO  = open(ruta)
    res: typing.IO = open("res.txt",'w')
    linea: str = archivo.readline()

    for i in range(0,lineas):
        if linea[0] != '#':
            res.write(linea)
    
#se me borro, no anda