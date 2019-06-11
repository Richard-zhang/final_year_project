data ProcF (i :: SType * *) (j :: SType * *) next where
    Send :: Sing (n :: Nat) -> Core a -> next 
            -> ProcF ('Free ('S n a j)) j next
    Recv :: Sing (n :: Nat) -> (Core a -> next)
            -> ProcF ('Free ('R n a j)) j next
    Branch :: Sing (n :: Nat) -> 
              Proc' left ('Pure ()) c -> 
              Proc' right ('Pure ()) c ->
              next -> 
              ProcF ('Free ('B n left right j)) j next
    Select :: Sing (n :: Nat) ->
              Core (Either a b) ->
              (Core a -> Proc' left ('Pure ()) c) ->
              (Core b -> Proc' right ('Pure ()) c) ->
              next ->
              ProcF ('Free ('Se n left right j)) j next

type Proc (i :: SType * *) a =
    forall j . IxFree ProcF (i >*> j) j (Core a)