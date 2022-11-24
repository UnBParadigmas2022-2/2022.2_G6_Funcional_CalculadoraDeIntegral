module Eval
    ( evalExpr
    ) where

import Language.Haskell.Interpreter

-- evalExpr :: (MonadIO m, exceptions-0.10.4:Control.Monad.Catch.MonadMask m) => String -> m (Either InterpreterError (Double -> Double))
evalExpr fExpr = do
    -- fExpr is a Haskell code supplied by your user as a String
    -- Create an interpreter that runs fExpr
    r <- runInterpreter $ do
            setImports ["Prelude"]
            interpret fExpr (as :: Double -> Double)
    -- run it and get an interface to the function
    case r of
        Left err -> putStrLn $ "Ups... " ++ (show err)
        Right f  -> do
            print $ f 10.0 
    
   
