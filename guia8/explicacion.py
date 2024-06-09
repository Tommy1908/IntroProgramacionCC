d:dict[str,str] = {"tiago":"ininputable","matias":"matas","agus":"sanin","mirko":"gordo compu","nacho":"jesus"}
dvacio: dict[int,list[tuple[int,int]]] = {}

print(d.keys())
print(d.values())
print(d.items())
#d.pop("mirko")
#d.clear()


d["cesar"] = "cheddar"
d["mirko"] = "gordo Haskell"

#print(d)

for k,v in d.items():
    print(f"key: {k}, value: {v}")

print("tiago" in d)
print("ininputable" in d)
print("tommy" in d)

print(d)
#
#palabras:list[str] = ["hola","mundo","palabra","agua","mateo","aaaaa","grgrgrgrgr"]
#
#print(palabras)
##Ahora los voy a clasificar y meter a un diccionario
#d: dict[int, int] = {}
#for i in range(len(palabras)):
#    if len(palabras[i]) not in d:
#        d[len(palabras[i])] = 1
#    else:
#        d[len(palabras[i])] += 1
#
#print(d)