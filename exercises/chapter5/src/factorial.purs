module Factorial where

import Prelude (map, otherwise, (*), (-), (>))
import Data.Maybe (
       Maybe(..))

factorial :: Int -> Maybe Int
factorial 0 = Just 1
factorial n | n > 0 = map (\x -> n * x) (factorial (n-1))
            | otherwise = Nothing