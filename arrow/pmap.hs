pmap :: ArrowPipe a b
     -> ArrowPipe a (a, (a, (a, a)))
     -> ArrowPipe (b, (b, (b, b))) b 
     -> ArrowPipe a b
pmap f s c = s >>> (f *** (f *** (f *** f))) >>> c