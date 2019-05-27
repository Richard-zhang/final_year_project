preduc :: ArrowPipe (a, a) a -> ArrowPipe (a, (a, (a, a))) a
preduc r = helper >>> (r *** r) >>> r
 where
  helper = (arr Id *** arr Fst) &&& (arr Snd >>> arr Snd)