import Data.Char
s :: String
s = "\n\
\q :: String -> String\n\
\q = (q':) . foldr quote [q']\n\
\    where\n\
\      sl = chr 92\n\
\      n = chr 10\n\
\      q' = chr 34\n\
\      quote c acc\n\
\        | c == q' = [sl, c] ++ acc\n\
\        | c == n = [sl, 'n', sl, n, sl] ++ acc\n\
\        | otherwise = (c : acc)\n\
\\n\
\main :: IO ()\n\
\main = do\n\
\  putStrLn \"import Data.Char\"\n\
\  putStrLn \"s :: String\"\n\
\  putStrLn (\"s = \" ++ q s)\n\
\  putStrLn s"

q :: String -> String
q = (q':) . foldr quote [q']
    where
      sl = chr 92
      n = chr 10
      q' = chr 34
      quote c acc
        | c == q' = [sl, c] ++ acc
        | c == n = [sl, 'n', sl, n, sl] ++ acc
        | otherwise = (c : acc)

main :: IO ()
main = do
  putStrLn "import Data.Char"
  putStrLn "s :: String"
  putStrLn ("s = " ++ q s)
  putStrLn s
