module NumericalMethods
    ( trapezoidal,
    compositeTrapeizoidal
    ) where

import Language.Haskell.Interpreter
 
e = exp 1

fun :: Double -> Double
fun x = eval "(x**2)   * (e**(-x))" -- x^2e^-x dx

trapezoidal :: Double -> Double -> Double
trapezoidal a b = ((fun a) + (fun b)) * ((b-a)/2)

h a b n = (b-a)/n

compositeTrapeizoidal :: Double -> Double -> Double -> Double
compositeTrapeizoidal __ 0 = 0
compositeTrapeizoidal a b n = ((fun a) + (fun b) + 2 * (sum [fun (a + (i* h a b n)) | i <- [1.. ((b-a)/h a b n)]])) * ((h a b n) / 2)