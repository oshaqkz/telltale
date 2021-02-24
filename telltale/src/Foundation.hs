module Foundation where

import           ClassyPrelude

newtype AppT m a =
  AppT { runAppT :: ReaderT String m a
       } deriving ( Functor
                  , Applicative
                  , Monad
                  , MonadReader String
                  )

