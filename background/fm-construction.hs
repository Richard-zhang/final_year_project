data Free f a
  = Pure a
  | Free f (Free f a)

instance Functor f => Monad (Free f) where
  return = pure
  (Pure x) >>= fab = fab x
  (Free fx) >>= fab = Free $ fmap (>>= fab) fx