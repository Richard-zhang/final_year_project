data STypeF a next where
    S :: Nat -> a -> next -> STypeF a next
    R :: Nat -> a -> next -> STypeF a next
    B :: Nat -> SType a c -> SType a c -> next -> STypeF a next
    Se :: Nat -> SType a c -> SType a c -> next -> STypeF a next

type SType a next = Free (STypeF a) next