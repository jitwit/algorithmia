{-# language LambdaCase #-}

module Main where

import Control.Lens
import Control.Monad
import Control.Monad.State
import Data.Bifunctor
import qualified Data.HashPSQ as Q
import qualified Data.Map as M
import Data.Map (Map)
import Linear

import Debug.Trace

type Coordinate = V2 Int
type Grid = Map Coordinate Square
type Search'Queue = Q.HashPSQ (V2 Int) Int ()

data Search'Result = S'R
  { parents :: M.Map Coordinate Coordinate
  , distances :: M.Map Coordinate Int }
  deriving (Show)

data Square = Wall | Space | Herb
  deriving (Show,Eq,Enum,Bounded,Ord)

square'of'char :: Char -> Square
square'of'char = \case
  '.' -> Space
  'H' -> Herb
  _   -> Wall

vertices :: Grid -> [Coordinate]
vertices g = [ v | (v,x) <- M.toList g, x `elem` [Space,Herb] ]

adjacent :: Grid -> Coordinate -> [Coordinate]
adjacent g u = [ v | v <- nesw u, ok $ M.lookup v g ] where
  ok = \case Just Space -> True; Just Herb -> True; _ -> False
  nesw (V2 x y) = [V2 (x-1) y,V2 (x+1) y, V2 x (y-1), V2 x (y+1)]

grid'of'string :: String -> Grid
grid'of'string s = M.fromList [ (V2 x y, square'of'char c)
                              | (y,l) <- zip [0..] $ lines s
                              , (x,c) <- zip [-length l`div`2..] l ]

dijkstra :: Grid -> Search'Result
dijkstra g = snd $ execState (dijkstra' g) (q,s) where
  q = Q.singleton zero 0 ()
  s = S'R M.empty $ M.insert zero 0 $ M.fromList $
    zip (vertices g) $ repeat maxBound

dijkstra' :: Grid -> State (Search'Queue, Search'Result) ()
dijkstra' g = gets (Q.findMin.fst) >>= \case
  Nothing -> pure ()
  Just (u,d,_) -> do
    modify (first Q.deleteMin)
    forM_ (adjacent g u) $ \v -> do
      (q,S'R ps ds) <- get
      let d' = d+1
          Just d'v = M.lookup v ds
      when (d' < d'v) $ do
        put $ (Q.insert v d' () q,S'R (M.insert v u ps) (M.insert v d' ds))
      dijkstra' g

todo = undefined

main = do
  xs <- readFile "input/15a.in"
  let g = grid'of'string xs
      S'R ps ds = dijkstra g
      Just dists = traverse id [ M.lookup v ds | (v,Herb) <- M.toList g ]
  print $ 2 * minimum dists
