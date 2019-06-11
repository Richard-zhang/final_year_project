liftF :: ProcF i j a -> IxFree ProcF i j a

(>>=) ::  IxFree ProcF i j a 
          -> (a -> IxFree ProcF j k b) 
          -> IxFree ProcF i k b

send
    Sing n
    -> Core a
    -> Proc ( 'Free ( 'S n a ( 'Pure ()))) a
send role value = liftF $ Send role value value

recv :: Sing n -> Proc ( 'Free ( 'R n a ( 'Pure ()))) a
recv role = liftF (Recv role id)