#Ejercicio 9. Sea el siguien codigo:

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g

g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

#1. ¿Cuál es el resultado de evaluar tres veces seguidas ro(1)?
#El resultado va incrementando
#2. ¿Cuál es el resultado de evaluar tres veces seguidas rt(1, 0)?
#No hay cambio en el resultado
#3. En cada función, realizar la ejecución simbólica.     (?)
#4. Dar la especicación para cada función, rt y ro.
