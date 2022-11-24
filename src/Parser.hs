module Parser
    ( trapezoidal,
    compositeTrapeizoidal
    ) where

type Parser a = String -> Maybe (a, String)
