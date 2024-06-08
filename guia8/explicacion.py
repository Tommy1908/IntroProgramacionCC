# archivo -> seq<char>

#archivo = open(nombre)
#archivo.close()

# '\n' es un solo caracter


#archivo = open("explicacion.txt")
#contenido = archivo.read()
#print(contenido)
#archivo.close


def separar_palabras(contenido:str,caracteresDistintos:list[str]) -> list[list[str]]:
    resultado: list[list[str]] = []
    expresion :list[str] = []
    palabra = "" 
    for i in range(len(contenido)):
        if len(expresion) < 4:
            caracterActual = contenido[i]
            if caracterActual in caracteresDistintos:
                expresion.append(palabra)
                palabra = ""
            else:
                palabra += caracterActual
        else:
            caracterActual = contenido[i]
            resultado.append(expresion)
            expresion = []
            caracterActual = contenido[i]
            if caracterActual in caracteresDistintos:
                expresion.append(palabra)
                palabra = ""
            else:
                palabra += caracterActual
                
    if palabra != "":
        expresion.append(palabra)
    if expresion != []:
        resultado.append(expresion)
    return resultado

print(separar_palabras("aa,bb,cc,dd,TO,ff,gg,hh",[","]))