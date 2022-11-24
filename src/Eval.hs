module Eval
    ( eval,
    ) where

import Language.Haskell.Interpreter

eval = do
    -- fExpr is a Haskell code supplied by your user as a String
    let fExpr = "let f (x:y:_) = x && y in f"
    -- Create an interpreter that runs fExpr
    r <- runInterpreter $ do
            setImports ["Prelude"]
            interpret fExpr (const True :: [Bool] -> Bool)
    -- run it and get an interface to the function
    case r of
        Left err -> putStrLn $ "Ups... " ++ (show err)
        Right f  -> do
            print $ f [True, False]
            print $ f [True, True]
