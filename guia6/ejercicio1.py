#python3
#exit() para salir o Ctrl + D

from math import *

###Ejercicio1
def imprimirHolaMundo() -> None:
    print("¡Hola mundo!")

#imprimirHolaMundo()

###Ejercicio2
def imprimir_un_verso() -> None:
    
    #print("I wake up fine and dandy, but then by the time I find it handy")
    #print("To rip my heart apart and start planning my crash landing I go up, up, up, up, up to the ceiling")
    #print("Then I feel my soul start leaving like an old man's hair receding")

    print("I wake up fine and dandy, but then by the time I find it handy \n" + \
        "To rip my heart apart and start planning my crash landing I go up, up, up, up, up to the ceiling\n" + \
        "Then I feel my soul start leaving like an old man's hair receding\n" + \
        "I'm pleading, 'Please, oh please' on my knees repeatedly asking\n" + \
        "Why it's got to be like this, is this living free?\n" + \
        "I don't wanna be the one, be the one to has the\n" + \
        "Sun's blood on my hands, I'll tell the moon\n" + \
        "Take this weapon, forged in darkness\n" + \
        "Some see a pen, I see a harpoon")

#imprimir_un_verso()

###Ejercicio3

def raizDe2() -> float:
    y = round(sqrt(2), 4)
    return y

###Ejercicio4

def factorial_de_dos() -> int:
    return factorial(2)

###Ejercicio5

def perimetro() -> float:
    return 2*pi



