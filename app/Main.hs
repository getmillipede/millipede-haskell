{-# LANGUAGE LambdaCase #-}

module Main (main) where

import System.Environment (getArgs)

eyes = cycle ["⦿⦿", "⦾⦾", "⟐⟐", "⪽⪾", "⨷⨷", "⨸⨸", "☯☯", "⊙⊙", "⊚⊚", "⊛⊛", "⨕⨕", "⊗⊗", "⊘⊘", "⊖⊖", "⁌⁍", "✩✩", "❈❈"]
shells = cycle ["()", "{}", "[]", "⨭⨮", "⨴⨵", "⊆⊇", "∣∣"]
bodies = cycle ["███", "XXX", "⧱⧰⧱", "⧯⧮⧯", "⧲⧳⧲","🁢🁢🁢", "✚✚✚", "⧓⧒⧑", "⦁⦁⦁", "☗☗☗", "❝❝❝"]


arthropod k = (face k):(repeat $ body k)

face k = let (l:r:[]) = eyes !! k
         in "╚" ++ l:" " ++ r:"╝"
body k = let (l:r:[]) = shells !! k
             c = bodies !! k
         in "╚═" ++ l:c ++ r:"═╝"

wiggle = map (flip replicate ' ') (4 : cycle [2,1,0,1,2,3,4,3])
millipede = zipWith (++) wiggle . arthropod

main :: IO ()
main = getArgs >>= \case
        []     -> beautiful $ millipede 0
        (x:[]) -> beautiful $ millipede (read x)
        where beautiful = putStrLn . unlines . take 20
