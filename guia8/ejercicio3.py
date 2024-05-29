import typing

#3)Invertir las lineas (la primera a la ultima, la segunda a la anteultima y viceversa)

def leer_lineas(ruta)-> list[str]:
    archivo: typing.IO = open(ruta)
    lineas: list[str] = archivo.readlines()
    archivo.close()
    return lineas

def contar_lineas(ruta:str) -> int:
    lineas: list[str] = leer_lineas(ruta)
    return len(lineas)

def invertir(ruta:str) -> None:

    lineas: list[str] = leer_lineas(ruta)
    res: typing.IO = open("reverso.txt",'w')

    lineas[len(lineas)-1] += "\n"

    for i in range(len(lineas)-1,-1,-1):
        res.write(lineas[i])

invertir("ejercicio3.txt")