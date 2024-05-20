#Ejercicio7 Usar For

#1)
def uno_al_diez() -> None:
    for i in range(1, 11):
        print(i)

#2)
def pares10_40() -> None:
    for i in range(10, 41, 2):
        print(i)

#3) Escribir una función que imprima la palabra eco 10 veces.
def eco10() -> None:
    for i in range(10): #{0,1,2,3...9}
        print("eco")

#4)
def cuentaRegresiva(n:int) -> None:
    for i in range(n, 0, -1):
        print(i)
    print("Despegue")

#5) (Al pasado)
def viajeEnElTiempo(ap:int,al:int) -> None:
    for i in range(ap,al,-1):
        print(f"Viajó un año al pasado, estamos en el año: {(ap-1)}")
        ap -= 1

#6) No muy seguro de este
def viajeEnElTiempo20(ap:int) -> None:
    for i in range(ap,-384,-20):
        print(f"Viajó un año al pasado, estamos en el año: {(ap-20)}")
        ap -= 20