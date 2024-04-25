--Ejercicio 4. En este ejercicio trabajaremos con la lista de contactos del telefono.

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

contactos1 = [("Tomas","1908"),("Matas","8"),("Mirko","7")]

--Sugerencia: Implementar las funciones auxiliares elNombre y elTelefono para que dado un contacto devuelva el dato del nombre y el telefono respectivamente.

--a)Implementar una funcion que me diga si una persona aparece en mi lista de contactos del telefono: 

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombrePreg (x:xs) | nombrePreg == (elNombre x) = True
                                 | otherwise = (enLosContactos nombrePreg xs)

--b) Implementar una funcion que agregue una nueva persona a mis contactos, si esa persona esta ya en mis contactos entonces actualiza el telefono..

--           (Nombre, Telefono) [Contacto]      [Contacto]
agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto contacto contactos = [contacto] ++ contactos

--c) Implementar una funcion que dado un nombre, elimine un contacto de mis contactos. Si esa persona no esta no hace nada.

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto nombre contactos | not(enLosContactos nombre contactos) = contactos
                                  | otherwise = (eliminarContactoAux nombre contactos)

eliminarContactoAux:: Nombre -> ContactosTel -> ContactosTel
eliminarContactoAux _ [] = []
eliminarContactoAux nombre (x:xs) | nombre == (elNombre x) = (eliminarContactoAux nombre xs)
                                  | otherwise = [x] ++ (eliminarContactoAux nombre xs)

------Funciones Sugeridas------

elNombre :: Contacto -> Nombre
elNombre (nombre,telefono) = nombre

elTelefono :: Contacto -> Telefono
elTelefono (nombre,telefono) = telefono