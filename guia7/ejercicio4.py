#Implementar una funcion para construir una lista con los nombres de mis estudiantes.
#La funcion solicitara al usuario los nombres hasta que ingrese la palabra “listo”. Devuelve la lista con todos los nombres ingresados.

#1)

def estudiantes() -> list[str]:
    entrada:str = ""
    res = []
    while entrada != "listo":
        print ("Ingrese nombres de estudiantes o listo: ")
        entrada = input()
        res += [entrada]
    res.remove("listo")
    return res
