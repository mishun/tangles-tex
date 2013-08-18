module Main where

import Diagrams.Prelude
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.CascadeCode
import Figures


main :: IO ()
main =
    let src, p1, p2 :: NonAlternatingTangle
        src = rotateTangle 1 $ decodeCascadeCode [(XO, 0), (MU, 0)]
        p1 = implode (0, [(0, 1), (0, 0), (0, 3), (0, 2), (0, 5), (0, 4)], [])
        p2 = implode (0, [(0, 3), (0, 2), (0, 1), (0, 0), (0, 5), (0, 4)], [])

    in putFigures $ map (scale 6)
        [ drawKnotSch src
        , drawKnotSch $ rotateTangle 1 p1
        , drawKnotSch $ rotateTangle 5 p2
        , drawKnotSch p2
        , drawKnotSch p1
        ]
