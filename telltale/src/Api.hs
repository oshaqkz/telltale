module Api where


import RIO

import Servant

type Api =
  "api" :> "channels" :>
  Get '[JSON] Text

