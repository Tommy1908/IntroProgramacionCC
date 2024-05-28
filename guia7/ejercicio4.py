import random

#Ejercicio 4. Implementar usando Input

#1)
#Implementar una funcion para construir una lista con los nombres de mis estudiantes.
#La funcion solicitara al usuario los nombres hasta que ingrese la palabra “listo”. Devuelve la lista con todos los nombres ingresados.

def estudiantes() -> list[str]:
    entrada:str = ""
    res = []
    while entrada != "listo":
        print ("Ingrese nombres de estudiantes o listo: ")
        entrada = input()
        res += [entrada]
    res.remove("listo")
    return res

#2)
#Implementar una funcion que devuelve una lista con el historial de un monedero electronico (por ejemplo la SUBE).
#El usuario debe seleccionar en cada paso si quiere:
#   “C” = Cargar creditos,
#   “D” = Descontar creditos,
#   “X” = Finalizar la simulacion (terminar el programa).
#En los casos de cargar y descontar creditos, el programa debe ademas solicitar el monto para la operacion. Vamos a asumir que el monedero comienza en cero.
#Para guardar la informacion grabaremos en el historial tuplas que representen los casos de cargar (“C”, monto a cargar) y descontar credito (“D”, monto a descontar).

#No voy a contemplar casos de entradas no validas, casos donde se descuente mas de lo que se tiene (va para negativo), y lo de convertir no se si se puede, tampoco dijieron que hacer
def monedero_electronico() -> list[(str,str)]:
    print("Bienvendio, seleccione “C” para cargar creditos, “D” descontarlos, y “X” para finalizar los movimientos")
    creditos:int = 0
    movimientos:list[(str,str)] = []
    mov:str = input("Seleccione el movimiento: ")
    while mov != 'X':
        if mov == 'C':
            monto = input("Cuanto desea cargar: ")
            creditos += int(monto)
            movimientos += [('C', monto)]
            print()
        elif mov == 'D':
            monto = input("Cuanto desea descontar: ")
            creditos -= int(monto)
            movimientos += [('D', monto)]
        else:
            mov = 'X'
        mov = input("Seleccione el movimiento: ")
    print(f"Se han completado con exito los movimientos, valor final {creditos}")

    return movimientos

#print(monedero_electronico())

#3)
#Vamos a escribir un programa para simular el juego conocido como 7 y medio.
#El mismo deber a generar un numero aleatorio entre 0 y 12 (excluyendo el 8 y 9) y deber a luego preguntarle al usuario si desea seguir sacando otra “carta” o plantarse.
#En este ultimo caso el programa debe terminar.
#Los numeros aleatorios obtenidos deberan sumarse segun el numero obtenido salvo por las “figuras” (10, 11 y 12) que sumaran medio punto cada una.
#El programa debe ir acumulando los valores y si se pasa de 7.5 debe informar que el usuario ha perdido.
#Al finalizar la funcion devuelve el historial de “cartas” que hizo que el usuario gane o pierda.
#Para generar numeros pseudo-aleatorios entre 1 y 12 utilizaremos la funcion random.randint(1,12).
#Al mismo tiempo, la funcion random.choice() puede ser de gran ayuda a la hora de repartir cartas.

#Tuve que buscar, el objetivo es llegar a 7.5 o acercarse lo mas posible, voy a simplificar las reglas un poco para hacerlo (cartas boca arriba y boca abajo y un solo jugador)

def siete_y_medio() -> list[int]:
    cartas:int = [1,2,3,4,5,6,7,10,11,12] * 4
    historial:int = []
    movimiento:chr = ''
    puntaje:float = 0
    enJuego:bool = True

    print("Bienvenido a 7 y medio")
    #2 primeras cartas
    a = random.choice(cartas)
    b = random.choice(cartas)

    print(f"Las cartas son el {a} y {b}")

    historial.append(a)
    historial.append(b)
    #Se pasan las figuras a su valor
    a = figuras_a_05(a)
    b = figuras_a_05(b)

    puntaje = a + b

    print(f"Vas '{puntaje}' puntos")
    #Si ya te pasaste termina el jeugo
    if puntaje >= 7.5:
        enJuego = False

    while enJuego:
        movimiento:chr = input("Plantarse(p) o Carta(c): ")
        if puntaje >= 7.5 or movimiento == 'p':
                enJuego = False
        else:
            a = random.choice(cartas)
            print(f"Tu carta es {a}")
            historial.append(a)
            a = figuras_a_05(a)
            puntaje += a
            print(f"Vas '{puntaje}' puntos")
            if puntaje >= 7.5:
                enJuego = False


    if puntaje > 7.5:
        print(f"Perdiste, tu puntaje: {puntaje}")
    elif puntaje == 7.5:
        print(f"Ganaste, tu puntaje es {puntaje} exactamente")
    else:
        print(f"Juego terminado, tu puntaje es {puntaje}")

    return historial

def figuras_a_05(a:int) -> float:
    if a in [10,11,12]:
        a = 0.5
    return a


print(siete_y_medio())