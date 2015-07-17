module Shlim where

import Data.List.Split

main = do
  contents <- getContents
  putStr (parseLines contents)

parseLines :: String -> String
parseLines = unlines . map (parseLine . words) . lines

parseLine :: [String] -> String
parseLine (x:xs) = concat ["<", unwords $ el:attr, ">", unwords xs, "</", el, ">"]
  where (el:attr) = (map tag) $ tagParts $ x

tagParts :: String -> [String]
tagParts = split (keepDelimsL $ oneOf ".#")

tag :: String -> String
tag ('.':xs) = "class='" ++ xs ++ "'"
tag ('#':xs) = "id='"    ++ xs ++ "'"
tag ""       = "div"
tag x        = x
