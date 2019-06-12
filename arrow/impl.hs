(>>>) :: (SArrow a b) -> (SArrow b c) -> (SArrow a c)
(>>>) leftArrow rightArrow start = compose firstPipe secondPipe
 where
  firstPipe  = leftArrow start
  secondPipe = rightArrow (end leftP + 1)