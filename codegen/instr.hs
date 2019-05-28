data Channel a where
    Channel :: CID -> ReprType a -> Channel a
  
data Exp a where
    Exp :: Core a -> ReprType a -> Exp a

data Instr where
    CInitChan :: Channel a -> Instr
    CDeleteChan :: Channel a -> Instr
    CSend :: Channel a -> Exp a -> Instr
    CRecv :: Channel a -> Exp a -> Instr
    CEnd :: Exp a -> Instr
    CDecla :: Int -> ReprType a -> Instr
    CAssgn :: Int -> Exp a -> Instr
    CBranch :: Exp a -> Seq Instr -> Seq Instr -> Instr
    CSelect :: Int -> Int -> Int -> Seq Instr -> Seq Instr -> Instr
    CEither2Label :: Int -> Int -> Instr