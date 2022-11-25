{-# LANGUAGE OverloadedStrings #-}

module MyPrompt
    ( printChoices,
    clearPrompt
    ) where

import System.IO

printChoices [] = putStrLn "\n----------------------------------------------------------------\n"
printChoices (h:t) = putStrLn h >> printChoices t

clearPrompt = putStrLn "\n\n\n\n----------------------------------------------------------------\n"


-- import System.IO

-- prompt :: String -> IO String
-- prompt text = do
--     putStr text
--     hFlush stdout
--     getLine

-- Now you can simply do

-- getPoint = do
--     xStr <- prompt "Enter x: "
--     yStr <- prompt "Enter y: "
--     return $ Point (read xStr) (read yStr)
