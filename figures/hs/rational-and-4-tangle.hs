module Main where

import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.CascadeCode
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let t1 = rotateTangle 1 $ rationalTangle [2, -3, 2]
        t2 = decodeCascadeCode [(MO, 1), (WO, -1), (MO, 0), (XU, -1), (XU, -1), (MU, 1), (XO, 1), (MO, -1), (WO, 1)]
    in putFigure $ scale 17 $
        drawKnotSch t1 ||| strutX 0.5 ||| drawKnotSch t2
