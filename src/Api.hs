module Api
  ( Api
  , handlers
  )
  where


import           RIO

import           Network.HTTP.Types
import           Network.Wai                    (responseLBS)
import           Network.Wai.Handler.WebSockets
import           Network.WebSockets
import           Servant

-- local imports
import           Foundation

type Api =
  "api" :> "channels" :>
  Capture "channel" Text :>
  Raw

handlers :: ServerT Api App
handlers channel = Tagged $ websocketsOr defaultConnectionOptions app backupApp
  where
    app = acceptRequest >=> flip sendTextData ("#" <> channel <> ":Hello, client")
    backupApp _ respond =
      respond $ responseLBS status400 [] "not a websocket request"

