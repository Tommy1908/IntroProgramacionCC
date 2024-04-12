{--
Ejercicio 6. Programar una funci´on bisiesto :: Integer ->Bool seg´un la siguiente especificaci´on:
problema bisiesto (a˜no: Z) : Bool {
requiere: {T rue}
asegura: {res = f alse ↔ a˜no no es m´ultiplo de 4 o a˜no es m´ultiplo de 100 pero no de 400}
}
Por ejemplo:
bisiesto 1901 ⇝ False, bisiesto 1904 ⇝ True,
bisiesto 1900 ⇝ False, bisiesto 2000 ⇝ True.
--}

bisiesto :: Int -> Bool
bisiesto x| mod x 4 == 0 || (mod x 100 == 0 && mod x 400 == 0) = True
          | otherwise = False