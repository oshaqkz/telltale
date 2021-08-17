{-# LANGUAGE TemplateHaskell #-}

module Foundation where

import           RIO

import           Control.Monad.Except
import           Data.Aeson.TH
import           Data.Aeson.Casing
import qualified Servant              as Servant


data Config =
  Config { vars :: Variables
         }

type App = AppT IO

newtype AppT m a =
  AppT { unAppT :: ReaderT Config m a
       } deriving ( Functor
                  , Applicative
                  , Monad
                  , MonadReader Config
                  )

data Variables = Variables { appPort :: Int
                           } deriving Show

$(deriveJSON defaultOptions { fieldLabelModifier = trainCase } ''Variables)

runAppT :: Config -> AppT m a -> m a
runAppT = flip $ runReaderT . unAppT

appToHandler :: Config -> App a -> Servant.Handler a
appToHandler config =
  Servant.Handler . ExceptT . try . ($ config) . flip runAppT

