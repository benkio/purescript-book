module FileOperations where

import Prelude

import Data.Path (Path, ls, isDirectory, root, size, filename)
import Data.Array (concatMap, (:))
import Data.Maybe (Maybe(..), isJust)
import Data.Foldable (foldr)

allFiles :: Path -> Array Path
allFiles root = root : concatMap allFiles (ls root)

allFiles' :: Path -> Array Path
allFiles' file = file : do
  child <- ls file
  allFiles' child

onlyFiles :: Path -> Array Path
onlyFiles p = foldr (\p1 p2 -> if (isDirectory p1) then (onlyFiles p1) <> p2 else p1 : p2) [] (ls p)

largestFile :: Path -> Maybe Path
largestFile p = foldr selectLargerFile Nothing (onlyFiles p)
              where
              selectLargerFile f Nothing = Just f
              selectLargerFile f mf@(Just actualF) = do
                               actualFSize <- size actualF
                               currentFSize <- size f
                               if (actualFSize >= currentFSize)
                                  then mf
                                  else Just f

whereIs :: String -> Maybe Path
whereIs searchTerm = whereIs' searchTerm root Nothing

whereIs' :: String -> Path -> Maybe Path -> Maybe Path
whereIs' searchTerm p parent
        | (isDirectory p) == false && searchTerm == (filename p) = parent
        | (isDirectory p) == false && searchTerm /= (filename p) = Nothing
        | otherwise = foldr matchFile Nothing (ls p)
        where
        matchFile p' m = if (isJust m) then m else whereIs' searchTerm p' (Just p)
