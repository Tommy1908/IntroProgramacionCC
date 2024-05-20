#Ejercicio6 Usar while

#1)
def uno_al_diez() -> None:
    i:int = 0
    while i <= 10:
        print(i)
        i += 1

#2)
def pares10_40() -> None:
    i:int = 10
    while i <= 40:
        if i % 2 == 0:
            print(i)
        i += 1

#3) Escribir una función que imprima la palabra eco 10 veces.
def eco10() -> None:
    i:int = 10
    while i > 0:
        print("eco")
        i -= 1

#4)
def cuentaRegresiva(n:int) -> None:
    while n > 0:
        print(n)
        n -= 1
    print("Despegue")

#5) (Al pasado)
def viajeEnElTiempo(ap:int,al:int) -> None:
    while ap > al:
        print(f"Viajó un año al pasado, estamos en el año: {(ap-1)}")
        ap -=1

#6) Creo que es asi
def viajeEnElTiempo20(ap:int) -> None:
    while (ap - 20) > -384:
        print(f"Viajó un año al pasado, estamos en el año: {(ap-20)}")
        ap -=20