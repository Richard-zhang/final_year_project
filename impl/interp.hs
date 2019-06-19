data MyState = MyState
    {
        outputValues :: [(Nat, String)],
        trace :: [String],
        messageQueue :: [(Nat, Nat, String)]
    }

interpret :: [(Proc (), Nat)] -> State MyState ()
interpret []       = return ()
interpret (x : xs) = interp x xs

interp :: (Proc (), Nat) -> [(Proc (), Nat)] -> State MyState ()
interp (Pure value, role) xs = do
    updateOutputValue role value
    interpret xs
interp (Free (Send receiver value next), role) xs = do
    updateMessageQueue (role, receiver, show $ interpCore value)
    updateTrace "send"
    interpret $ xs ++ [(next, role)]
interp p@(Free (Recv sender cont), role) xs = do
    (x, y, v) <- getTopMessage
    if x == sender && y == role
        then do
            popMessageQueue
            updateTrace "recv"
            let value = Lit (read v)
            interpret $ xs ++ [(cont value, role)]
        else
            interpret $ xs ++ [p]