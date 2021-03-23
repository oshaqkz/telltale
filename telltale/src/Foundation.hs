module Foundation where

import           ClassyPrelude

data Config =
  Config { _something :: Text
         }

type App a = AppT IO a

newtype AppT m a =
  AppT { runAppT :: ReaderT Config m a
       } deriving ( Functor
                  , Applicative
                  , Monad
                  , MonadReader Config
                  , MonadIO
                  )

