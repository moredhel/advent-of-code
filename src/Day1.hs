{-# LANGUAGE OverloadedStrings #-}
module Day1 where

import Debug.Trace
import qualified Data.Map.Strict as Map
import qualified Data.Set as Set
import Data.Sequence
import qualified Data.Sequence as S
import qualified Prelude as P
import Prelude

type X = Int

day1 :: IO ()
day1 = do
  f <- readFile "./data/day1_1.txt"
  let out = parse f
  let val = handle2 (0, Set.empty, out) out
  putStrLn $ show $ val


handle2 (value, set, instructions) (x:xs) = let val = value + x in if Set.member val set then val else handle2 (val, Set.insert val set, instructions) xs
handle2 tpl@(value, set, instructions) [] = trace "looping" $ handle2 tpl instructions

-- part 1 helpers...
type Delta = X

-- parse :: String -> [Delta]
parse = fmap spl . lines

-- spl :: String -> Delta
spl ('-':x) = -1 * (read x :: X)
spl ('+':x) = read x :: X
spl _       = undefined
