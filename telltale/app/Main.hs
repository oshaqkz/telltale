module Main where

import           Server              (start)

main :: IO ()
main =
  putStrLn "Launching missiles..." >> start
