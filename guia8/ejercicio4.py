import typing
#Ejercicio 4

def agregar_frase_final(ruta: str, frase: str) -> None: #
    archivo:typing.IO = open(ruta,'a')
    archivo.write(frase + "\n") #Asumo que ahi terminaria esa linea
    archivo.close()
    print(type(archivo))
agregar_frase_final("ejercicio4.txt","                       a")