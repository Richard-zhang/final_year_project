-- Parent threads and child threads communicate the results via IVar
newtype IVar a = IVar (IORef (IVarContents a))
data IVarContents a = Full a | Blocked [a -> Action]

data Action =
    Fork Action Action
  | Stop
  -- Get operation blocks when the underlying IVarContents is Blocked
  | forall a . Get (IVar a) (a -> Action) 
  -- Put operation updates the underlying IVarContetns to Full with the result a 
  -- And resume a list of blocking Thread by applying a to the continuation
  | forall a . Put (IVar a) a Action      
  | forall a . New (IVar a -> Action)