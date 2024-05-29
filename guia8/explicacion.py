# archivo -> seq<char>

#archivo = open(nombre)
#archivo.close()

# '\n' es un solo caracter


archivo = open("explicacion.txt")
contenido = archivo.read()
print(contenido)
archivo.close