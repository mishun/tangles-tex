module Main where

import Diagrams.Prelude
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.NonAlternating.Satellites
import Figures


main :: IO ()
main =
    let t :: NonAlternatingTangle
        t = implode $ read "(0,[(8,1),(8,2),(8,3),(3,1),(7,2),(4,0)],[([(2,0),(6,0),(8,0),(2,1)],(I / DS | -|-)),([(1,0),(1,3),(3,0),(6,1)],(C / DS | -|-)),([(2,2),(0,3),(7,1),(6,2)],(I / DS | -|-)),([(0,5),(6,3),(5,1),(5,0)],(I / DS | -|-)),([(4,3),(4,2),(7,0),(7,3)],(I / DS | -|-)),([(1,1),(2,3),(3,3),(4,1)],(I / DS | -|-)),([(5,2),(3,2),(0,4),(5,3)],(C / DS | -|-)),([(1,2),(0,0),(0,1),(0,2)],(I / DS | -|-))])"
    in putFigures
        [ drawKnotSch t # scale 15
        , {- drawKnotSch $ twistedDoubleSatellite t -}drawKnotSch t # scale 15
        ]
