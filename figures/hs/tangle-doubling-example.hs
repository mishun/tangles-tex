module Main where

import Diagrams.Prelude
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.CascadeCode
import Math.KnotTh.Tangle.NonAlternating.Satellites
import Figures


main :: IO ()
main =
    let t = decodeCascadeCode [(MO, 1), (WO, 1), (MO, 0)]
    in putFigures $ map (scale 15)
        [ drawKnotSch t
        , drawKnotSch $ twistedDoubleSatellite t
        ]
