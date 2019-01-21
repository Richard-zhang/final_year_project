data GreetingF next
    = Getname (String -> next)
    | Greet String next
    deriving Functor

type Greeting = Free GreetingF

getName = liftF $ Getname id
greet str = liftF $ Greet str ()

goodMorningProgram :: Greeting ()
goodMorningProgram = do
    a <- getName
    b <- getName
    greet $ "Good Morning " ++ a ++ " and " ++ b

ioInterpreter :: Greeting a -> IO a
ioInterpreter = interpret helper
    where
        helper (Getname next) = fmap next getLine
        helper (Greet str next) = putStrLn str >> return next

executeProgram = ioInterpreter goodMorningProgram