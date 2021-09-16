module Redis where


import           RIO

import           Database.Redis

-- local imports
import           Foundation

runQuery :: MonadIO m => Redis a -> m a
runQuery query = liftIO $ do
  conn <- connect defaultConnectInfo
  runRedis conn query
