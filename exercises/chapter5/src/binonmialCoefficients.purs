module BinomialCoefficients where
  
import Prelude (map, (-), (+), (/=))
import Data.List (range, singleton, List, filter)

pascalRule :: Int -> Int -> Int
pascalRule 0 0 = 1
pascalRule 0 _ = 0
pascalRule n k = (pascalRule (n-1) k) + (pascalRule (n-1) (k-1))

binomialCoefficients :: Int -> List Int
binomialCoefficients 0 = singleton (pascalRule 0 0)
binomialCoefficients n = filter (\x -> x /= 0) (map (\k -> pascalRule n k) (range 0 (n+1)))