{-# LANGUAGE OverloadedStrings #-}

module MyIO
    ( printChoices,
    clearScreen,
    prompt
    ) where

import System.IO

printChoices :: [String] -> IO ()
printChoices [] = putStrLn "\n----------------------------------------------------------------\n"
printChoices (h:t) = putStrLn h >> printChoices t

clearScreen :: IO ()
clearScreen = putStrLn "\n\n\n\n----------------------------------------------------------------\n"


prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine


