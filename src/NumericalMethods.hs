module NumericalMethods
    ( trapezoidal,
    compositeTrapeizoidal,
    simpsons13
    ) where


trapezoidal :: Double -> Double -> (Double -> Double) -> Double
trapezoidal a b fun = ((fun a) + (fun b)) * ((b-a)/2)

h :: Double -> Double -> Double ->  Double
h a b n = (b-a)/n

compositeTrapeizoidal :: Double -> Double -> Double -> (Double -> Double)-> Double
compositeTrapeizoidal _ _ 0 _ = 0
compositeTrapeizoidal a b n fun = ((fun a) + (fun b) + 2 * (sum [fun (a + (i* h a b n)) | i <- [1.. ((b-a)/h a b n)]])) * ((h a b n) / 2)

simpsons13 :: Double -> Double -> (Double -> Double) -> Double
simpsons13 a b fun = ((b-a)/2)/3 * (fun a + fun b + 4*(fun (a+b/2)))