{-# LANGUAGE OverloadedStrings #-}

module MyPrompt
    ( printChoices,
    clearPrompt
    ) where

import System.IO

printChoices [] = putStrLn "\n----------------------------------------------------------------\n"
printChoices (h:t) = putStrLn h >> printChoices t

clearPrompt = putStrLn "\n\n\n\n----------------------------------------------------------------\n"