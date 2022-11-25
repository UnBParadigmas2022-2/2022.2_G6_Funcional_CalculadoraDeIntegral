 {-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import NumericalMethods
import Language.Haskell.Interpreter
import Data.Text(pack, unpack, replace)
import System.Exit
import System.IO

formatExpr :: String -> String
formatExpr = unpack . replace "e" "(exp 1)" . pack

main :: IO ()
main = do
    putStrLn "\nDigite a expressão da integral:"
    putStrLn "\n Ex: (x**2) * 2"

    input_expr <- getLine 
    hFlush stdout
    -- "e * x**2

    let fExpr =   "let f x = " ++ (formatExpr input_expr) ++ " in f"

    r <- runInterpreter $ do
            setImports ["Prelude"]
            interpret fExpr (as :: Double -> Double)

    case r of
        Left err -> putStrLn $ "Erro no parse... " ++ (show err)
        Right f  -> do
            putStrLn "CALCULADORA DE INTEGRAL"
            putStrLn "Escolha um método para calcular sua integral:"
            putStrLn "0    <- Método do trapézio"
            putStrLn "1    <- Método do trapézio composto"
            putStrLn "2    <- Sair"

            c <- getChar
            hFlush stdout
            case c of
                '0' -> do 
                    putStrLn "\nDigite o valor de a:"
                    input_a <- getLine 
                    hFlush stdout
                    let a = (read input_a :: Double)
                    hFlush stdout

                    putStrLn "\nDigite o valor de b:"

                    input_b <- getLine 
                    hFlush stdout
                    let b = (read input_b :: Double)  

                    putStr "\nResultado:" >> putStr  (show (trapezoidal a b f)) >> putChar '\n'
                '1' -> do 
                    putStrLn "\nDigite o valor de a:"
                    input_a <- getLine 
                    hFlush stdout
                    let a = (read input_a :: Double)

                    putStrLn "\nDigite o valor de b:"
                    input_b <- getLine 
                    hFlush stdout
                    let b = (read input_b :: Double)  

                    putStrLn "\nDigite o número de iterações:"
                    input_n <- getLine 
                    hFlush stdout
                    let n = (read input_n :: Double)  

                    putStr "\nResultado:" >> putStr  (show (compositeTrapeizoidal a b n f)) >> putChar '\n'
                '2' -> putChar '\n' >> putStrLn "Saindo..." >> exitSuccess

            putStrLn "--------------------------------------"    
    main

