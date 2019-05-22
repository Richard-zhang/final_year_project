divConquer
  :: Int
  -> ArrowPipe a b
  -> ArrowPipe a (a, a)
  -> ArrowPipe (b, b) b
  -> ArrowPipe a b
divConquer 0 baseFunc _split _merge = baseFunc
divConquer level baseFunc split merge =
  split
    >>> (   divConquer (level - 1) baseFunc split merge
        *** divConquer (level - 1) baseFunc split merge
        )
    >>> merge

twoWayThreeLevelDq = divConquer 3