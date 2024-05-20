#Ejercicio 5

#1) 

def devolver_el_doble_si_es_par(n:int) -> int:
    if n % 2 == 0:
        return 2*n
    else:
        return n

#2)

def devolver_valor_si_es_par_sino_el_que_sigue(n:int) -> int:
    if (n%2==0):
        return n
    else:
        return (n+1)
    
#3)

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(n:int) -> int:
    if(n%9==0):
        return 3*n
    elif(n%3==0):
        return 2*n
    else:
        return n
    
#4)

def lindo_nombre(nombre:str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tienem uchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"
    
#5)
#Esta rarazo explicado este
def elRango(n:int) -> str:
    if n < 5:
        return "Menor a 5"
    elif 10 <= n <= 20:
        return "Entre 10 y 20"
    elif n > 20:
        return "Mayor a 20"
    else:
        return "No especificado"

#6)

def trabajo_o_vacaciones(s:chr,e:int) -> str:
    if(s == 'M'):
        if(18 <= e < 65):
            return "Te toca trabajar"
        else:
            return "Andá de vacaciones"
    else:
        if(18 <= e < 60):
            return "Te toca trabajar"
        else:
            return "Andá de vacaciones"
