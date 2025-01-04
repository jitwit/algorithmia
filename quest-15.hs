{-# language LambdaCase, TemplateHaskell #-}

module Main where

import Control.Lens
import Control.Monad
import Control.Monad.State
import qualified Data.HashPSQ as Q
import qualified Data.Map as M
import Data.Map (Map)
import Data.Maybe
import Linear

type Coordinate = V2 Int
type Grid = Map Coordinate Square
type Search'Queue = Q.HashPSQ (V2 Int) Int ()

data Search'Result = S'R
  { parents :: M.Map Coordinate Coordinate
  , distances :: M.Map Coordinate Int }
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

dijkstra :: Grid -> Search'Result
dijkstra g = snd $ execState (dijkstra' g) (q,s) where
  q = Q.singleton zero 0 ()
  s = S'R M.empty $ M.insert zero 0 $ M.fromList $
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

main = do
  g'a <- grid'of'string <$> readFile "input/15a.in"
  let S'R ps ds = dijkstra g'a
      dists = catMaybes [ M.lookup v ds | (v,Herb _) <- M.toList g'a ]
  print $ 2 * minimum dists
  g'b <- grid'of'string <$> readFile "input/15b.in"
  let herbs = [ hv | hv@(_, Herb _) <- M.toList g'b ]
  print herbs
