#Nota: 10.0 / 10.0 (APROBADO) 
#Preguntas teoricas:
#A) ¿Qué es una variable en Python? (0.75 punto)
# Una función que devuelve valores aleatorios.
# [X] Un contenedor para almacenar datos que puede cambiar durante la ejecución del programa.
# Un tipo de dato que solo puede contener números enteros.

#B) ¿Cuál es la función de un ciclo en Python? (0.75 punto)
# Ejecutar un conjunto de instrucciones una sola vez.
# [X] Ejecutar repetidamente un conjunto de instrucciones hasta que una condición se evalúe como falsa.
# Definir una constante que no puede ser cambiada.
     
#C) ¿Cuál es la finalidad de un Control Flow Graph en testing? (0.5 punto)
# Identificar todas las posibles salidas de un programa.
# [X] Visualizar todos los posibles caminos de ejecución para asegurar la cobertura completa del código.
# Determinar los puntos de entrada y salida del programa.

from queue import Queue as Cola

# Ejercicio 1
#El juego del gallina es una competición en la que dos participantes conducen un vehículo en dirección al del contrario; si alguno se desvía de la trayectoria de choque pierde y es humillado por comportarse como un "gallina". Se hizo un torneo para ver quién es el menos gallina. Juegan todos contra todos una vez y van sumando puntos, o restando. Si dos jugadores juegan y se chocan entre sí, entonces pierde cada uno 5 puntos por haberse dañado. Si ambos jugadores se desvían, pierde cada uno 10 puntos por gallinas. Si uno no se desvía y el otro sí, el gallina pierde 15 puntos por ser humillado y el ganador suma 10 puntos! En este torneo, cada persona que participa tiene una estrategia predefinida para competir: o siempre se devía, o nunca lo hace. Se debe programar la función 'torneo_de_gallinas' que recibe un diccionario (donde las claves representan los nombres de los participantes que se anotaron en el torneo, y los valores sus respectivas estrategias) y devuelve un diccionario con los puntajes obtendidos por cada jugador.
#problema torneo_de_gallinas (in estrategias: dict⟨String,String⟩) : dict⟨String,Z⟩ {
#  requiere: {estrategias tiene por lo menos 2 elementos (jugadores)}
#  requiere: {Las claves de estrategias tienen longitud mayor a 0}
#  requiere: {Los valores de estrategias sólo pueden ser los strings "me desvio siempre" ó "me la banco y no me desvio"}
#  asegura: {Las claves de res y las claves de estrategias son iguales}
#  asegura: {para cada jugador p perteneciente a claves(estrategias), res[p] es igual a la cantidad de puntos que obtuvo al finalizar el torneo, dado que jugó una vez contra cada otro jugador}
#}

#estrategias: dict[str,str] = {"jugador1":"me la banco y no me desvio","tomas":"me la banco y no me desvio","mirko":"me la banco y no me desvio","agus":"me desvio siempre","matas":"me desvio siempre"}

def torneo_de_gallinas(estrategias: dict[str,str]) -> dict[str,int]:
    res:dict[str,int] = {}

    for jugador,estrategia in estrategias.items():
        puntos: int = 0
        for k,v in estrategias.items():
            if jugador != k:
                if estrategia == "me la banco y no me desvio" and v == "me la banco y no me desvio":
                    puntos -= 5
                elif estrategia == "me la banco y no me desvio" and v == "me desvio siempre":
                    puntos += 10
                elif estrategia == "me desvio siempre" and v == "me la banco y no me desvio":
                    puntos -= 15
                else: #ambos desvios
                    puntos -= 10
            res[jugador] = puntos

    return res

#print(torneo_de_gallinas(estrategias))


# Ejercicio 2
# En el banco ExactaBank los clientes hacen cola para ser atendidos por un representante. Los clientes son representados por las tuplas (nombre, tipo afiliado) donde la primera componente es el nombre y el tipo afiliado puede ser "comun" o "vip".
# Se nos pide implementar una función en python que dada una cola de clientes del banco, devuelva una nueva cola con los mismos clientes pero en donde los clientes vip estan primero que los clientes comunes manteniendo el orden original de los clientes vips y los comunes entre sí.

# problema reordenar_cola_priorizando_vips (in filaClientes: Cola⟨String x String⟩) : Cola⟨String⟩ {
#   requiere: {La longitud de los valores de la primera componente de las tuplas de la cola filaClientes es mayor a 0}
#   requiere: {Los valores de la segunda componente de las tuplas de la cola filaClientes son "comun" o "vip" }
#   requiere: {No hay dos tuplas en filaClientes que tengan la primera componente iguales entre sí }
#   asegura: {todo valor de res aparece como primera componente de alguna tupla de filaClientes}
#   asegura: {|res| = |filaCliente|}
#   asegura: {res no tiene elementos repetidos}
#   asegura: {No hay ningun cliente "comun" antes que un "vip" en res}
#   asegura: {Para todo cliente c1 y cliente c2 de tipo "comun" pertenecientes a filaClientes si c1 aparece antes que c2 en filaClientes entonces el nombre de c1 aparece antes que el nombre de c2 en res}
#   asegura: {Para todo cliente c1 y cliente c2 de tipo "vip" pertenecientes a filaClientes si c1 aparece antes que c2 en filaClientes entonces el nombre de c1 aparece antes que el nombre de c2 en res}
# }

def reordenar_cola_priorizando_vips(fila_clientes: Cola[tuple[str,str]]) -> Cola[str]:
    res:Cola = Cola()

    datos:list[tuple[str,str]] = []
    while not(Cola.empty(fila_clientes)):
        datos.append(fila_clientes.get())
    #Devuelvo datos a cola
    for i in range(len(datos)):
        fila_clientes.put(datos[i])


    for i in range(len(datos)):
        if datos[i][1] == "vip":
            res.put(datos[i][0])
    for i in range(len(datos)):
        if datos[i][1] == "comun":
            res.put(datos[i][0])

    return res

# fila_clientes:Cola[tuple[str,str]] = Cola()
# fila_clientes.put(("Tomas","comun"))
# fila_clientes.put(("Mirko","vip"))
# fila_clientes.put(("Matas","vip"))
# fila_clientes.put(("Agus","comun"))
# fila_clientes.put(("ultimoComun","comun"))
# fila_clientes.put(("granVip","vip"))
# fila_clientes.put(("viptarde","vip"))

# print(reordenar_cola_priorizando_vips(fila_clientes))
#respuesta = reordenar_cola_priorizando_vips(fila_clientes)
# while not(Cola.empty(respuesta)):
#     print(respuesta.get())
# print("Veo si es de tipo in")
# while not(Cola.empty(fila_clientes)):
#     print(fila_clientes.get())




# Ejercicio 3
# Decimos que una palabra es palíndromo si se lee igual de izquierda a derecha que de derecha a izquierda. Se nos pide programar en python la siguiente función:
# problema cuantos_sufijos_son_palindromos(in texto:String) : Z {
#   requiere: -
#   asegura: {res es igual a la cantidad de palíndromos que hay en el conjunto de sufijos de texto}
# }
# Nota: un sufijo es una subsecuencia de texto que va desde una posición cualquiera hasta el al final de la palabra. Ej: "Diego", el conjunto de sufijos es: "Diego", "iego","ego","go", "o". Para este ejercicio no consideraremos a "" como sufijo de ningun texto. 

def cuantos_sufijos_son_palindromos(texto: str) -> int:
    res:int = 0
    #Duplico la palabra sin usar copy (no lo use mucho, me aseguro)
    palabra:list[str] = []
    for i in range(len(texto)):
        palabra += ((list(texto))[i])

    for k in range(len(palabra)): #Itera la longitud del texto
        reverso:list[str] = []
        for i in range(len(palabra)-1,-1,-1):
            reverso += palabra[i]
        if palabra == reverso:
            res += 1
        palabra.pop(0)

    return res

#print(cuantos_sufijos_son_palindromos("ca ñ sasbsas"))
#print(cuantos_sufijos_son_palindromos("   "))
#print(cuantos_sufijos_son_palindromos(""))


# Ejercicio 4

# Ana y Beto juegan al Ta-Te-Ti-Facilito. El juego es en un tablero cuadrado de lado entre 5 y 10. Cada jugador va poniendo su ficha en cada turno. Juegan intercaladamente y comienza Ana. Ana pone siempre una 'X' en su turno y Beto pone una 'O' en el suyo. Gana la persona que logra poner 3 fichas suyas consecutivas en forma vertical. Si el tablero está completo y no ganó nadie, entonces se declara un empate. El tablero comienza vacío, representado por ' ' en cada posición.
# Notar que dado que juegan por turnos y comienza Ana poniendo una 'X' se cumple que la cantidad de 'X' es igual a la cantidad de 'O' o bien la cantidad de 'X' son uno más que la cantidad de 'O'.
# Se nos pide implementar una función en python 'problema quien_gano_el_tateti_facilito' que determine si ganó alguno, o si Beto hizo trampa (puso una 'O' cuando Ana ya había ganado).
# problema quien_gano_el_tateti_facilito(inf tablero:seq⟨seq⟨Char⟩) : Z {
#   requiere: {tablero es una matriz cuadrada}
#   requiere: {5<=|tablero[0]|<= 10}
#   requiere: {tablero sólo tiene 'X', 'O' y ' ' (espacio vacío) como elementos}
#   requiere: {En tablero la cantidad de 'X' es igual a la cantidad de 'O' o bien la cantidad de 'X' es uno más que la cantidad de 'O'}
#   asegura: {res = 1 <==> hay tres 'X' consecutivas en forma vertical(misma columna) y no hay tres 'O' consecutivas en forma vertical(misma columna) }
#   asegura: {res = 2 <==> hay tres 'O' consecutivas en forma vertical (misma columna) y no hay tres 'X' consecutivas en forma vertical(misma columna) }
#   asegura: {res = 0 <==> no hay tres 'O' ni hay tres 'X' consecutivas en forma vertical}
#   asegura: {res = 3 <==> hay tres 'X' y hay tres 'O' consecutivas en forma vertical (evidenciando que beto hizo trampa)}
# }

def quien_gano_el_tateti_facilito(tablero: list[list[str]]) -> int:
    ana:bool = False
    beto:bool = False

    for k in range(len(tablero[0])): #Izq der
        consecutivos:int = 0
        sim:str = " "
        for i in range(len(tablero)): #Arriba abajo
            if tablero[i][k] == " " or tablero[i][k] == "":
                consecutivos = 0
                sim = " "
            elif tablero[i][k] == "X":
                if sim == "X":
                    consecutivos +=1
                else:
                    sim = "X"
                    consecutivos = 1
            else:
                if sim == "O":
                    consecutivos +=1
                else:
                    sim = "O"
                    consecutivos = 1

            if consecutivos == 3:
                if sim == "O":
                    beto = True
                elif sim == "X":
                    ana = True

    res:int = 3
    if ana and not beto:
        res = 1
    elif not ana and beto:
        res = 2
    elif not ana and not beto:
        res = 0

    return res

# tablero1 =[
#     [" "," "," "," "," "," "," "," "],
#     ["X"," "," "," "," "," "," "," "],
#     ["X"," "," "," "," ","X"," ","X"],
#     ["O"," "," "," "," "," "," ","X"],
#     ["O"," ","O"," "," "," "," ","X"],
#     [" "," ","X","O"," ","O"," ","O"],
#     ["X"," ","O"," ","O"," "," ","O"],
#     ["X"," "," "," "," "," "," ","O"]
# ]
# print(quien_gano_el_tateti_facilito(tablero1))
