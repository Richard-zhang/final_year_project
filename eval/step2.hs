mergesort :: Int -> SArrow [Int] [Int]
mergesort = divConq sort split merge

divConq ::
     SArrow a b
  -> SArrow a (Either c (a, a))
  -> SArrow (Either c (b, b)) b
  -> Int
  -> SArrow a b
divConq baseFunc _ _ 0 = baseFunc
divConq baseFunc alg coalg x =
  alg
    >>> (   arr Inl
        ||| (   (   (arr Fst >>> 
                     divConq baseFunc alg coalg (x - 1))
                &&& (arr Snd >>> 
                     divConq baseFunc alg coalg (x - 1))
                )
            >>> arr Inr
            )
        )
    >>> coalg