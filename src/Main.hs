
module Main (main) where

import NumericalMethods
import Eval

main :: IO ()
main = do
    let fExpr = "let f x = x**2 in f"
    evalExpr fExpr
    -- case r of
    --     Left err -> putStrLn $ "Ups... " ++ (show err)
    --     Right f  -> do
    --         print $ f 10.0 

    -- putStr (show (compositeTrapeizoidal 1 7 10000))