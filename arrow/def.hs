data Pipe a b = Pipe
    { start :: Nat
    , cont  :: a -> Proc
    , env   :: Map Nat Proc
    , end   :: Nat
    }
  
type ArrowPipe a b = Nat -> Pipe a b

instance Arrow ArrowPipe where 
    -- implementation omit