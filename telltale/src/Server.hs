module Server where


import           RIO

import           Data.Yaml
import           Network.Wai.Handler.Warp (run)
import           Servant                  (hoistServer, serve)

-- local imports
import           Api
import           Foundation

start :: IO ()
start = do

  vars@Variables{..} <- decodeFileThrow "config.yaml"

  let config = Config{..}
      app    = serve api $ hoistServer api (appToHandler config) handlers

  run appPort app


api :: Proxy Api
api = Proxy
