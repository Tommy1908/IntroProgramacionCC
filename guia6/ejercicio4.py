#usando las funciones de python min y max

#3 kg por cada centímetro hasta 3 metros
#2 kg por cada centímetro arriba de los 3 metros

def peso_pino (hm:float) -> float:
    hc = hm * 100 
    peso = 0
    if hc <= 300:
        peso += 3 * hc
    else:
        peso += 900 + (2 * (hc - 300))
    return peso

def es_peso_util (peso:float) -> bool:
    return 400 <= peso <= 1000

def sirve_pino (hm:float) -> bool:
    return es_peso_util(peso_pino(hm))