liftF :: Functor f => f a -> Free f a
liftF = Free . fmap Pure

freeM :: (Functor f, Functor g) => (f a -> g a) -> (Free f a) -> (Free g a)
freeM phi (Pure x ) = Pure x
freeM phi (Free fa) = Free $ phi (fmap (freeM phi) fa)

monad :: Monad m => Free m a -> m a
monad (Pure x  ) = pure x
monad (Free mfx) = mfx >>= monad

interpret :: (Functor f, Monad m) => (f a -> m a) -> (Free f a -> m a)  
interpret phi = monad . freeM phi