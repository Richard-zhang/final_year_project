mergeSort :: [Int] -> [Int]
mergeSort = hylo merge split where
  merge Empty      = []
  merge (Leaf c)   = [c]
  merge (Node l r) = usualMerge l r

  split []  = Empty
  split [x] = Leaf x
  split xs  = Node l r where
    (l, r) = splitAt (length xs `div` 2) xs