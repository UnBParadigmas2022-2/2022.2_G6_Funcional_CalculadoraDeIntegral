 {-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import NumericalMethods
import Language.Haskell.Interpreter
import Data.Text(pack, unpack, replace)
import System.Exit
import System.IO
import MyIO

formatExpr :: String -> String
formatExpr = unpack . replace "e" "(exp 1)" . pack

main :: IO ()
main = do
    printChoices ["CALCULADORA DE INTEGRAL\n",
                    "Digite a expressão da integral:",
                    "Ex. de expressão: (x**2) * e + 2"]
    input_expr <- getLine 
    hFlush stdout
    clearScreen
    let fExpr =   "let f x = " ++ (formatExpr input_expr) ++ " in f"

    r <- runInterpreter $ do
            setImports ["Prelude"]
            interpret fExpr (as :: Double -> Double)

    case r of
        Left err -> putStrLn $ "Erro no parse... " ++ (show err)
        Right f  -> do
            printChoices ["Escolha um método para calcular sua integral definida de a até b:",
                          "0    <- Método do trapézio",
                          "1    <- Método do trapézio composto",
                          "2    <- Sair"]
            
            c <- getChar
            hFlush stdout
            putStrLn "\n\n\n--------------------------------\n"

            case c of
                '0' -> do 
                    input_a <- prompt  "\nDigite o valor de a:"
                    let a = (read input_a :: Double)

                    input_b <- prompt  "\nDigite o valor de b:"
                    let b = (read input_b :: Double)  

                    putStr "\nResultado:" >> putStr  (show (trapezoidal a b f)) >> putChar '\n'
                '1' -> do 
                    input_a <- prompt  "\nDigite o valor de a:"
                    let a = (read input_a :: Double)

                    input_b <- prompt  "\nDigite o valor de b:"
                    let b = (read input_b :: Double)  

                    input_n <- prompt  "\nDigite o número de iterações:"
                    let  n= (read input_n :: Double)  

                    putStr "\nResultado:" >> putStr  (show (compositeTrapeizoidal a b n f)) >> putChar '\n'
                '2' -> putChar '\n' >> putStrLn "Saindo..." >> exitSuccess

            putStrLn "Digite qualquer tecla para continuar..."    
            c <- getChar
            clearScreen
    main

