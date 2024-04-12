sumatoria :: Int -> Int
sumatoria i | i==0 = 0
            | otherwise = i + sumatoria (i-1)


sumaLosPrimerosNImpares :: Integer -> Integer
sumaLosPrimerosNImpares n | n == 1 = 1
                          | n > 1 = n_esimoImpar + sumaLosPrimerosNImpares (n-1)
                        where n_esimoImpar = 2*n - 1
