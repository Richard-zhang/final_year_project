data Pipe a b = Pipe
    { start :: Nat
    , cont  :: a -> Proc
    , env   :: Map Nat Proc
    , end   :: Nat
    }
  
type SArrow a b = Nat -> Pipe a b

instance Arrow SArrow where
instance ArrowChoice SArrow where