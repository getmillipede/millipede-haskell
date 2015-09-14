{-# LANGUAGE LambdaCase #-}

module Main (main) where

import System.Environment (getArgs)

millipede = zipWith (++) wiggle arthropod
arthropod = "╚⊙ ⊙╝":(repeat "╚═(███)═╝")
wiggle = map (flip replicate ' ') (4 : cycle [2,1,0,1,2,3,4,3])

main :: IO ()
main = getArgs >>= \case
        []    -> beautiful millipede
        (x:_) -> beautiful $ take (1 + read x) millipede
        where beautiful = putStrLn . unlines
