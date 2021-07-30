module Main where

import           RIO
import           RIO.ByteString.Lazy (putStrLn)

-- local imports
import           Server              (start)

main :: IO ()
main =
  putStrLn "Launching missiles..." >> start
