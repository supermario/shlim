module Shlim where

import Data.List.Split

main = do
  contents <- getContents
  putStr (parseLines contents)

parseLines :: String -> String
parseLines = unlines . map (parseLine) . lines

parseLine :: String -> String
parseLine = parse . words

parse :: [String] -> String
parse (x:xs) = concat ["<", unwords $ el:attr, ">", unwords xs, "</", el, ">"]
  where (el:attr) = tagParts x

tagParts :: String -> [String]
tagParts = (map tag) . split (keepDelimsL $ oneOf ".#")

tag :: String -> String
tag ('.':xs) = "class='" ++ xs ++ "'"
tag ('#':xs) = "id='"    ++ xs ++ "'"
tag ""       = "div"
tag x        = x
