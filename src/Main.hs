 {-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import NumericalMethods
import Language.Haskell.Interpreter
import Data.Text(pack, unpack, replace)

replaceEuler :: String -> String
replaceEuler = unpack . replace "e" "(exp 1)" . pack

main :: IO ()
main = do
    let fExpr =   "let f x = " ++ replaceEuler "e * x**2 in f"

    r <- runInterpreter $ do
            setImports ["Prelude"]
            interpret fExpr (as :: Double -> Double)

    case r of
        Left err -> putStrLn $ "Erro no parse... " ++ (show err)
        Right f  -> do
            putStr (show (compositeTrapeizoidal 1 7 10000 f))
