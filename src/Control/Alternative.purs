module Control.Alternative
  ( class Alternative
  , guard
  , module Control.Alt
  , module Control.Applicative
  , module Control.Apply
  , module Control.Plus
  , module Data.Functor
  ) where

import Control.Alt (class Alt, alt, (<|>))
import Control.Applicative (class Applicative, pure, liftA1, unless, when)
import Control.Apply (class Apply, apply, (*>), (<*), (<*>))
import Control.Plus (class Plus, empty)
import Data.Unit (Unit, unit)

import Data.Functor (class Functor, map, void, ($>), (<#>), (<$), (<$>))

-- | The `Alternative` type class has no members of its own; it just specifies
-- | that the type constructor has both `Applicative` and `Plus` instances.
-- |
-- | Types which have `Alternative` instances should also satisfy the following
-- | laws:
-- |
-- | - Distributivity: `(f <|> g) <*> x == (f <*> x) <|> (g <*> x)`
-- | - Annihilation: `empty <*> f = empty`
class (Applicative f, Plus f) <= Alternative f

instance alternativeArray :: Alternative Array

guard :: forall m. Alternative m => Boolean -> m Unit
guard true = pure unit
guard false = empty
