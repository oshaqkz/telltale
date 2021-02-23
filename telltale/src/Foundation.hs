module Foundation where

import Control.Monad.Reader

newtype AppT m a =
  AppT { runAppT :: ReaderT String m a
       }

