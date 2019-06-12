pmap :: SArrow a b
     -> SArrow a (a, (a, (a, a)))
     -> SArrow (b, (b, (b, b))) b 
     -> SArrow a b
pmap f s c = s >>> (f *** (f *** (f *** f))) >>> c