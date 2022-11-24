-- module Eval
--     ( evalExpr
--     ) where

-- import Language.Haskell.Interpreter

-- -- evalExpr :: (MonadIO m, exceptions-0.10.4:Control.Monad.Catch.MonadMask m) => String -> m (Either InterpreterError (Double -> Double))
-- evalExpr fExpr = do
--     r <- runInterpreter $ do
--             setImports ["Prelude"]
--             interpret fExpr (as :: Double -> Double)
--     case r of
--         Left err -> putStrLn $ "Ups... " ++ (show err)
--         Right f  -> do
--             print $ f 10.0 
    
   
