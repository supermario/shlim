import Data.Char

main = do
  contents <- getContents
  putStr (compile contents)


compile :: String -> String
compile = unlines . map parse . lines

parse :: String -> String
parse = tag . words

tag :: [String] -> String
tag (x:xs) = concat ["<", x, ">", unwords xs, "</", x, ">"]
