main = fmap putStrLn ((++) >>= \f -> show >>= \x -> return $ f x) "main = fmap putStrLn ((++) >>= \\f -> show >>= \\x -> return $ f x) "
