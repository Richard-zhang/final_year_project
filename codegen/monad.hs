data CodeGenState = CodeGenState
  {
    chanTable :: Map ChanKey CID,
    varNext   :: Int,
    chanNext  :: CID,
    dataStructCollect :: Set AReprType
  }

newtype CodeGen m a = 
  CodeGen { runCodeGen :: StateT CodeGenState m a }
    deriving (Functor, 
              Applicative, 
              Monad, 
              MonadState CodeGenState, 
              MonadIO)