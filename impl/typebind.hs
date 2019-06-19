type family (>*>) (a :: SType * c) (b :: SType * c) where
   'Free ('S r v n) >*> b = 'Free ('S r v (n >*> b))
   'Free ('R r v n) >*> b = 'Free ('R r v (n >*> b))
   'Free ('B r n1 n2 n3) >*> b = 'Free ('B r n1 n2 (n3 >*> b))
   'Free ('Se r n1 n2 n3) >*> b = 'Free ('Se r n1 n2 (n3 >*> b))
   'Pure _ >*> b = b