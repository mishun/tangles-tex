module Main where

import Data.List (inits)
import Diagrams.Prelude
import Math.KnotTh.Tangle.Projection
import Math.KnotTh.Tangle.CascadeCode
import Figures


main :: IO ()
main = putFigures $ map (scale 8 . drawKnotSch) $
    zipWith rotateTangle [0, 0, 0, 4, 3, 4] $ map decodeCascadeCode $
        inits [(X, 0), (X, 0), (M, 3), (X, 5), (X, 2)]
