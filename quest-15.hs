{-# language LambdaCase, TemplateHaskell #-}

module Main where

import Control.Lens
import Control.Monad
import Control.Monad.State
import qualified Data.HashPSQ as Q
import qualified Data.HashMap.Strict as M
import Data.HashMap.Strict (HashMap)
import Data.List
import Data.Maybe
import Data.Ord
import Linear

type Coordinate = V2 Int
type Grid = HashMap Coordinate Square
type Search'Queue = Q.HashPSQ (V2 Int) Int ()

data Search'Result = S'R
  { parents :: HashMap Coordinate Coordinate
  , distances :: HashMap Coordinate Int }
  deriving (Show)

data Square = Wall | Space | Lake | Herb Char
  deriving (Show,Eq,Ord)

makePrisms ''Square

square'of'char :: Char -> Square
square'of'char = \case
  '.' -> Space
  '#' -> Wall
  '~' -> Lake
  h   -> Herb h

vertices :: Grid -> [Coordinate]
vertices g = [ v | (v,x) <- M.toList g, x & isn't _Wall ]

adjacent :: Grid -> Coordinate -> [Coordinate]
adjacent g u = [ v | v <- nesw u, ok $ M.lookup v g ] where
  ok = \case Just Space -> True; Just (Herb _) -> True; _ -> False
  nesw (V2 x y) = [V2 (x-1) y,V2 (x+1) y, V2 x (y-1), V2 x (y+1)]

grid'of'string :: String -> Grid
grid'of'string s = M.fromList [ (V2 x y, square'of'char c)
                              | (y,l) <- zip [0..] $ lines s
                              , (x,c) <- zip [-length l`div`2..] l ]

dijkstra :: Grid -> Coordinate -> Search'Result
dijkstra g v = snd $ execState (dijkstra' g) (q,s) where
  q = Q.singleton v 0 ()
  s = S'R M.empty $ M.insert v 0 $ M.fromList $
    zip (vertices g) $ repeat maxBound

dijkstra' :: Grid -> State (Search'Queue, Search'Result) ()
dijkstra' g = gets (Q.findMin.fst) >>= \case
  Nothing -> pure ()
  Just (u,d,_) -> do
    modifying _1 Q.deleteMin
    forM_ (adjacent g u) $ \v -> do
      (q,S'R ps ds) <- get
      let d' = d+1; Just d'v = M.lookup v ds
      when (d' < d'v) $ put $
        (Q.insert v d' () q,S'R (M.insert v u ps) (M.insert v d' ds))
    dijkstra' g

todo = undefined

part'a g = 2 * minimum d'hs where
  S'R _ ds = dijkstra g zero
  d'hs = catMaybes [ M.lookup v ds | (v,Herb _) <- M.toList g ]

part'b g = minimum ds where
  dat = [ (h,v,distances $ dijkstra g v) | (v, h@(Herb _)) <- M.toList g ]
  [h'a,h'b,h'c,h'd,h'e] = groupBy (\(x,_,_) (y,_,_) -> x == y) $
    sortBy (comparing $ view _1) dat
  S'R _ d'z = dijkstra g zero
  ds = [ d'z M.! v'a + d'a M.! v'c + d'c M.! v'e +
         d'e M.! v'd + d'd M.! v'b + d'b M.! zero
       | (_,v'a,d'a) <- h'a, (_,v'b,d'b) <- h'b, (_,v'c,d'c) <- h'c
       , (_,v'd,d'd) <- h'd, (_,v'e,d'e) <- h'e ]

main = do
  print =<< part'a . grid'of'string <$> readFile "input/15a.in"
  print =<< part'b . grid'of'string <$> readFile "input/15b.in"  
