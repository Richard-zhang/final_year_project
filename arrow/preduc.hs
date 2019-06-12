preduc :: SArrow (a, a) a -> SArrow (a, (a, (a, a))) a
preduc r = helper >>> (r *** r) >>> r
 where
  helper = (arr Id *** arr Fst) &&& (arr Snd >>> arr Snd)