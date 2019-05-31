data ProcF next where
    Send :: Nat -> Core a -> next -> ProcF next

    Recv :: Nat -> (Core a -> next) -> ProcF next

    Select :: Nat
           -> Core (Either a b)
           -> (Core a -> Proc c)
           -> (Core b -> Proc c)
           -> next
           -> ProcF next

    Branch :: Nat -> Proc c -> Proc c -> (Core c -> next) -> ProcF next

    Broadcast :: [Nat]
              -> Core (Either a b)
              -> (Core a -> Proc c)
              -> (Core b -> Proc c)
              -> (Core c -> next)
              -> ProcF next

type Proc a = Free ProcF (Core a)