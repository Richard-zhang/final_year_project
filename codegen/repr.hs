data ReprType a where
  NumReprType :: NumType a -> ReprType a
  LabelReprType :: ReprType Label
  SumReprType :: ReprType a -> ReprType b -> ReprType (Either a b)
  UnitReprType :: ReprType ()
  ProductReprType :: ReprType a -> ReprType b -> ReprType (a, b)
  ListReprType :: ReprType a -> ReprType [a]