class Arrow y where
    -- function signatures of arrow combinatorics
    arr :: (a -> b) -> y a b
    first :: y a b -> y (a, c) (b, c)
    second :: y a b -> y (c, a) (c, b)
    (***) :: y a c -> y b d -> y (a, b) (c, d)
    (&&&) :: y a b -> y a c -> y a (b, c)
    (|||) :: y a c -> y b c -> y (Either a b) c