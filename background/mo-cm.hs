-- Basic unit of computation : Action
-- A program is the composition of Actions.
data Action = 
    Atom (IO Action)   -- Atom is a IO computation followed by an action
  | Fork Action Action -- Fork is two 'parallel' action
  | Stop               -- Stop is the termination of an action


-- Using a monad C to encapsulates continuation
newtype C a = C { runC :: (a -> Action) -> Action }

instance Monad C where
    (>>=) :: C a -> (a -> C b) -> C b -- Monad bind is used to represent sequence of Actions
    m >>= f  = C $ \k -> runC m (\v -> runC (f v) k)
    return :: a -> C a
    return x = C $ \k -> k x

-- A sequential scheduler
schedule :: [Action] -> IO ()
schedule [] = return ()
schedule (a:as) = sched as a

sched :: [Action] -> Action -> IO ()
sched as (Atom ioa) = do
    a <- ioa
    schedule $ as ++ [a] 
sched as (Fork a1 a2) = schedule $ as ++ [a2, a1]
sched as Stop = schedule as

-- Combinators to compose programs
atom :: IO a -> C a
atom m = C $ \k -> Atom $ do
    r <- m
    return $ k r

fork :: C () -> C ()
fork m = C $ \k -> Fork (runC m (const Stop)) (k ())