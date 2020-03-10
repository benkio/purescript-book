module FileOperations where

import Prelude

import Data.Path (Path, ls, isDirectory)
import Data.Array (concatMap, (:))
import Data.Foldable (foldr)

allFiles :: Path -> Array Path
allFiles root = root : concatMap allFiles (ls root)

allFiles' :: Path -> Array Path
allFiles' file = file : do
  child <- ls file
  allFiles' child

onlyFiles :: Path -> Array Path
onlyFiles p = guardIsDirectory (isDirectory p) p
          where
          guardIsDirectory true  x = foldr (\a b -> (onlyFiles a) <> b) [] (ls x)
          guardIsDirectory false x = [x]
