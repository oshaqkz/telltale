module Foundation where

import           ClassyPrelude
import           Katip         (LogEnv)

data Config =
  Config { _logEnv :: LogEnv
         }

type App a = AppT IO a

newtype AppT m a =
  AppT { unAppT :: ReaderT Config m a
       } deriving ( Functor
                  , Applicative
                  , Monad
                  , MonadReader Config
                  )

runAppT :: Config -> AppT m a -> m a
runAppT = flip $ runReaderT . unAppT

