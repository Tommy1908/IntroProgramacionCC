--Nota: 10.0 / 10.0 (APROBADO)

{-Conteste marcando la opción correcta. En el contexto de la programación funcional, se llama polimorfismo:
 Cuando una función puede invocarse con distintos tipos de datos sin tener que redefinirla. [x]
 Cuando una función puede invocarse con distintos tipos de datos teniendo que definirla para cada tipo de dato particular. []
 Cuando tengo un tipo de dato que puede ser usado para invocar a muchas funciones.[]
 -}

 {-
Enunciado
Una reconocida empresa de comercio electrónico nos pide desarrollar un sistema de stock de mercadería.
El conjunto de mercaderías puede representarse con una secuencia de nombres de los productos donde puede haber productos repetidos.
El stock puede representarse como una secuencia de tuplas de dos elementos,
donde el primero es el nombre del producto y el segundo es la cantidad que hay en stock (en este caso no hay nombre de productos repetidos).
También se cuenta con una lista de precios de productos representada como una secuencia de tuplas de dos elementos,
donde el primero es el nombre del producto y el segundo es el precio.
-}

--Ejercicio 1 (2 puntos)
{-
problema generarStock (productos: seq⟨seq⟨Char⟩⟩): seq⟨seq⟨Char⟩ x Z⟩ {
  requiere: {True}
  asegura: {La longitud de res es igual a la cantidad de productos distintos que hay en productos}
  asegura: {Para cada producto que pertenece a productos existe un i tal que 0 <= i < |res| y res[i]0=producto y res[i]1 es igual a la cantidad de veces que aparece producto en productos}
}-}

-- productos = ["agua","agua","celular","agua","celular","celular","laptop","celular","laptop","pc","mouse"]
-- productos2 = ["lapiz","agua","celular","agua","goma","celular","celular","laptop","celular","laptop","pc","mouse","mouse"]
-- productos3 = ["elemento"]
-- productos4 = []

generarStock :: [[Char]] -> [([Char],Int)]
generarStock [] = []
generarStock (x:xs) = [(x,contarCantidadApariciones (x:xs) x)] ++ generarStock (quitarTodos (x:xs) x)

contarCantidadApariciones :: [[Char]] -> [Char] -> Int
contarCantidadApariciones [] _ = 0
contarCantidadApariciones (x:xs) elemento | x == elemento = 1 + contarCantidadApariciones xs elemento
                                          | otherwise = contarCantidadApariciones xs elemento

quitarTodos :: [[Char]] -> [Char] -> [[Char]]
quitarTodos [] _ = []
quitarTodos (x:xs) elemento | x == elemento = quitarTodos xs elemento
                            | otherwise = [x] ++ quitarTodos xs elemento

-- Ejercicio 2 (2 puntos)
{-
problema stockDeProducto (stock:seq⟨seq⟨Char⟩ x Z⟩, producto: seq⟨Char⟩) : Z {
  requiere: {No hay productos repetidos en stock}
  requiere: {Todas las cantidades de los productos que hay en stock son mayores a cero}
  asegura: {(res = 0 y producto no se encuentra en el stock) o (existe un i tal que 0 <= i < |stock| y producto=stock[i]0 y res = stock[i]1)}
}-}
--No hay repetidos, y las cantidades +0 pero no dice que no se pueda []

-- stock1 = [("agua",3),("celular",4),("laptop",2),("pc",1),("mouse",1)]
-- stock2 = [("lapiz",1),("agua",2),("celular",4),("goma",1),("laptop",2),("pc",1),("mouse",2)]
-- stock3 = [("elemento",1)]
-- stock4 = []

--                     stock        producto
stockDeProducto :: [([Char],Int)] -> [Char] -> Int
stockDeProducto [] _ = 0
stockDeProducto ((nombre,cantidad):xs) producto | nombre == producto = cantidad
                                                | otherwise = stockDeProducto xs producto


-- Ejercicio 3 (2 puntos)
{-
problema dineroEnStock (stock:seq⟨seq⟨Char⟩ x Z⟩, precios: seq⟨seq⟨Char⟩ x R⟩: R {
  requiere: {No hay productos repetidos en stock}
  requiere: {Todas las cantidades de los productos que hay en stock son mayores a cero}
  requiere: {No hay productos repetidos en precios}
  requiere: {Todos los precios de los productos son mayores a cero}
  requiere: {Todo producto en stock aparece en la lista de precios}
  asegura: {res es igual a la suma de los precios de todos los productos que están en stock multiplicado por la cantidad de cada producto que hay en stock}
}
Para resolver este ejercicio pueden utilizar la función del Preludio de Haskell fromIntegral
que dado un valor de tipo Int devuelve su equivalente de tipo Float-}
--La lista vacia sigue siendo una opcion
--No dice que no pueda haber precios a productos que no haya en stock!! ojo



--                   Stock              Precios
dineroEnStock :: [([Char],Int)] -> [([Char],Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock ((nombre,cantidad):xs) ((objeto,precio):ps) = dineroEnStockAux ((nombre,cantidad):xs) ((objeto,precio):ps) + dineroEnStock xs ((objeto,precio):ps)

--Resultado de un elemento (el primero)
dineroEnStockAux :: [([Char],Int)] -> [([Char],Float)] -> Float
dineroEnStockAux [] _ = 0
dineroEnStockAux ((nombre,cantidad):xs) ((objeto,precio):ps) | nombre == objeto = precio * fromIntegral(cantidad)
                                                             | otherwise = dineroEnStockAux ((nombre,cantidad):xs) ps


-- Ejercicio 4 (3 puntos)
{-
problema aplicarOferta (stock:seq⟨seq⟨Char⟩ x Z⟩, precios: seq⟨seq⟨Char⟩ x R⟩: seq⟨seq⟨Char⟩ x R⟩ {
  requiere: {No hay productos repetidos en stock}
  requiere: {Todas las cantidades de los productos que hay en stock son mayores a cero}
  requiere: {No hay productos repetidos en precios}
  requiere: {Todos los precios de los productos son mayores a cero}
  requiere: {Todo producto en stock aparece en la lista de precios}
  asegura: {|res| = | precios|}
  asegura: {Para todo 0 <= i < |precios| si stockDeProducto(stock, precios[i]0) > 10 entonces res[i]0 = precios[i]0 y res[i]1 = precios[i]1 * 0,80}
  asegura: {Para todo 0 <= i < |precios| si stockDeProducto(stock, precios[i]0) <= 10 entonces res[i]0 = precios[i]0 y res[i]1 = precios[i]1}
}-}
--Para cada elemento de precio, si el producto esta en +10 de stock, se le aplica un 0.80 al precio
--Es lo mismo que si hay mas de 10 en stock, y esa es la lista de entrada. Entonces si el stock de un productos es 10 o menos, lo dejo como esta
--No puede ser 0 el stock, asi que no aparecen, y si es mayor a 10, busco su precio correspondiente y lo multiplico por 0.80

-- stck = [("agua",30),("celular",10),("laptop",25),("pc",8),("mouse",250)]
-- stck2 = [("lapiz",100),("agua",2),("celular",40),("goma",1),("laptop",10),("pc",100),("mouse",9)]
-- stck3 = [("elemento",1)]
-- stck4 = []

-- precios1 = [("lapiz",100),("agua",25.5),("celular",3500.2),("goma",1),("laptop",2000),("pc",1000),("mouse",2.5),("elemento",10)]
-- precios2 = [("pc",1000),("a",5),("agua",25.5),("bait",9999),("celular",3500.2),("elemento",10),("mouse",2.5),("laptop",2000),("lapiz",100),("goma",1)]
--La respues es en el orden de precios

aplicarOferta :: [([Char],Int)] -> [([Char],Float)] -> [([Char],Float)]
aplicarOferta _ [] = [] 
aplicarOferta stock ((objeto,precio):ps) = [(objeto,aplicarOfertaAux stock (objeto,precio))] ++ aplicarOferta stock ps


aplicarOfertaAux :: [([Char],Int)] -> ([Char],Float) -> Float
aplicarOfertaAux [] (objeto,precio) = precio --Igual este caso no deberia darse nunca
aplicarOfertaAux ((nombre,cantidad):xs) (objeto,precio) | nombre == objeto && cantidad > 10 = precio * 0.80
                                                        | nombre == objeto && cantidad <= 10 = precio
                                                        | otherwise = aplicarOfertaAux xs (objeto,precio)