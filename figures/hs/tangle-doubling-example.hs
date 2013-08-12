module Main where

import Diagrams.Prelude
import Diagrams.Backend.Postscript
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.NonAlternating.Satellites
import Math.KnotTh.Draw.DrawKnot
import Figures
import qualified FigureScheme as S


drawOpts :: DrawKnotSettings
drawOpts = defaultDraw
    { threadWidth      = S.threadWidth
    , threadColour     = S.threadColour
    , borderWidth      = S.borderWidth
    , borderColour     = S.borderColour
    , backgroundColour = S.backgroundColour
    }


main :: IO ()
main =
    let d = 0.3
        t = implode $ read "(0,[(8,1),(8,2),(8,3),(3,1),(7,2),(4,0)],[([(2,0),(6,0),(8,0),(2,1)],(I / DS | -|-)),([(1,0),(1,3),(3,0),(6,1)],(C / DS | -|-)),([(2,2),(0,3),(7,1),(6,2)],(I / DS | -|-)),([(0,5),(6,3),(5,1),(5,0)],(I / DS | -|-)),([(4,3),(4,2),(7,0),(7,3)],(I / DS | -|-)),([(1,1),(2,3),(3,3),(4,1)],(I / DS | -|-)),([(5,2),(3,2),(0,4),(5,3)],(C / DS | -|-)),([(1,2),(0,0),(0,1),(0,2)],(I / DS | -|-))])"
    in putFigure (Width 500,
            drawKnot drawOpts t
                ||| strutX d
                ||| strutX d
                ||| drawKnot drawOpts (twistedDoubleSatellite t)
        )
