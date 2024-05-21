#No estoy muy seguro a que se refiere el enunciado, aprovechando que puedo cambiar facilmente los tipos voy a hacerlo aca

#1
x:int = 5
y:int = 7

x = x + y

print(x)

#2
x:int = 5
y:int = 7

z:int = x + y
y = z * 2

print(z)
print(y)

#3
x:int = 5
y:int = 7

x:str = "hora"
y:str = x*2

print(x)
print(y)

#4
x:bool = False

res:bool = not x

print(res)

#5
x:bool = False

x = not x

print(x)

#6
x:bool = True
y:bool = False

res:bool = x and y
x = res and x

print(res)
print(x)