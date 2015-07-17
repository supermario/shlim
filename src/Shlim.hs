module Shlim where

import Data.List.Split

main = do
  contents <- getContents
  putStr (parseLines contents)

parseLines :: String -> String
parseLines = unlines . map (parseLine . words) . lines

parseLine :: [String] -> String
parseLine (x:xs) = concat ["<", open, ">", unwords xs, "</", close, ">"]
  where
      parts = tagParts $ x
      (close:_) = parts
      open = concat . (map tag) $ parts

tagParts :: String -> [String]
tagParts = split (keepDelimsL $ oneOf ".")

tag :: String -> String
tag ('.':xs) = " class='" ++ xs ++ "'"
tag ""       = "div"
tag x        = x
