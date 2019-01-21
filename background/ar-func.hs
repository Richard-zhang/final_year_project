instance Arrow (->) where
    -- Minimal implementation: arr and ***
    arr f = f
    (***) f g ~(x,y) = (f x, g y)