preduc :: SArrow (a, a) a -> SArrow (a, (a, (a, a))) a
preduc r = assoc >>> (r *** r) >>> r
 where
  assoc = (arr Id *** arr Fst) &&& (arr Snd >>> arr Snd)