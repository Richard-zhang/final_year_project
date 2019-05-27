(>>>) :: (ArrowPipe a b) -> (ArrowPipe b c) -> (ArrowPipe a c)
(>>>) leftArrow rightArrow start = compose firstPipe secondPipe
 where
  firstPipe  = leftArrow start
  secondPipe = rightArrow (end leftP + 1)