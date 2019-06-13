constToCExpr :: ReprType a -> a -> CExpr
constToCExpr (NumReprType numType) v = numTypeToCExpr numType v
constToCExpr LabelReprType         v = case v of
  Le -> cVar "LEFT"
  Ri -> cVar "RIGHT"
constToCExpr s@(ProductReprType a b) v = defCompoundLit
  (show s)
  [ ([], initExp $ constToCExpr a (fst v))
  , ([], initExp $ constToCExpr b (snd v))
  ]