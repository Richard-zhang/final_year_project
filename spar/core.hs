data Core a where
    Lit :: a -> Core a
    Var :: Int -> Core a
    Prim  :: String -- XXX: name of the "primitive function"
             -> a -- Semantics in Haskell of the primitive function
             -> Core a

    Ap :: Core (a -> b) -> Core a -> Core b
    Id :: Core (a -> a)
    Const :: Core a -> Core (b -> a)

    Fst :: Core ((a, b) -> a)
    Snd :: Core ((a, b) -> b)
    Pair :: Core a -> Core b -> Core (a, b)

    Inl :: Core (a -> Either a b)
    Inr :: Core (b -> Either a b)