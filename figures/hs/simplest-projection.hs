module Main where

import Data.List (inits)
import Diagrams.Prelude
import Math.KnotTh.Tangle.Projection
import Figures


main :: IO ()
main = putFigure $ scale 3 $
    drawKnotSch lonerProjection
