main = let quine s = s ++ show s in
  putStrLn $ quine "main = let quine s = s ++ show s in\n  putStrLn $ quine "
