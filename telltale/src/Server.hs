module Server where


import           RIO

import           Network.Wai.Handler.Warp (run)
import           Servant                  (hoistServer, serve)

-- local imports
import           Api
import           Foundation

start :: IO ()
start = do

  let config = Config "test"
      app    = serve api $ hoistServer api (appToHandler config) handlers

  run 3000 app


api :: Proxy Api
api = Proxy
