module Foundation where

import           RIO

import           Control.Monad.Except
import qualified Servant              as Servant


data Config =
  Config { _temp :: Text
         }

type App = AppT IO

newtype AppT m a =
  AppT { unAppT :: ReaderT Config m a
       } deriving ( Functor
                  , Applicative
                  , Monad
                  , MonadReader Config
                  )

runAppT :: Config -> AppT m a -> m a
runAppT = flip $ runReaderT . unAppT

appToHandler :: Config -> App a -> Servant.Handler a
appToHandler config =
  Servant.Handler . ExceptT . try . ($ config) . flip runAppT

