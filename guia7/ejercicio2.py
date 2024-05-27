#Ejercicio 2. Implementar las siguientes funciones sobre secuencias pasadas por parametro:

#1)Dada una lista de numeros, en las posiciones pares borra el valor original y coloca un cero.
#Esta funcion modifica el parametro ingresado, es decir, la lista es un parametro de tipo inout.

#!Es inout, es decir devuelvo lst
def cero_en_par(lst:list[int]) -> list[int]:
    for i in range(len(lst)):
        if i % 2 == 0:
            lst[i] = 0

    return lst

#2)Lo mismo del punto anterior pero esta vez sin modificar la lista original, devolviendo una nueva lista. Es decir, la lista pasada como parametro es de tipo in
lista = [1,2,3,4,5,6,7,8,9,10]

def cero_en_par_in(lst:list[int]) -> list[int]:
    res:list = []
    for i in range(len(lst)):
        if i % 2 == 0:
            res.append(0)
        else:
            res.append(lst[i])
    return res

#3) Dada una cadena de caracteres devuelva una cadena igual a la anterior, pero sin las vocales. No se agregan espacios, sino que borra la vocal y concatena a continuacion.

def sin_vocales(x:list[chr]) -> list[chr]:
    vocales = ['a','e','i','o','u']
    res:list[chr] = []
    for i in range(len(x)):
        if (x[i] not in vocales):
            res.append(x[i])
    return res


#4)
#problema reemplaza vocales (in s:seq<Char>) : seq<Char> {
    #requiere: { True }
    #asegura: {|res| = |s|}
    #asegura: {Para todo i ∈ Z, si 0 ≤ i < |res| → (pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>, s[i]) ∧ res[i] = ‘ ’) ∨ (¬ pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>, s[i]) ∧ res[i] = s[i] ) ) }
#} Yo entiendo que si pertenece deja en espacio en blanco, ' '

def reeplaza_vocales(s:list[chr]) -> list[chr]:
    res:list[chr] = s.copy() #pense que necesitaba deep copy
    vocales = ['a','e','i','o','u']

    for i in range(len(s)):
        if s[i] in vocales:
            res[i] = ' '

    return res

word = ['h','e','l','l','o',' ','w','o','r','l','d'] 
print(word)
#print(reeplaza_vocales(word))
#print(word)

#5)
#in -> s
def da_vuelta_srt(s:list[chr]) -> list[chr]:
    res:list[chr] = s.copy()
    for i in range(len(s)):
        res[i] = s[len(s) - i -1]

    return res

#print(da_vuelta_srt(word))
#print(word)

#6)

def eliminar_repetidos(s:list[chr]) -> list[chr]:
    res:list[chr] = []

    for i in range(len(s)):

        if s[i] not in res:
            res.append(s[i])
            
    return res

