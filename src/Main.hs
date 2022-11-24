
module Main (main) where

import NumericalMethods

main :: IO ()
main = putStr (show (compositeTrapeizoidal 1 7 10000))