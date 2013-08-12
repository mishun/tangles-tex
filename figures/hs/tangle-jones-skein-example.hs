module Main where

import Diagrams.Prelude
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Tangle.CascadeCode
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
    let src, p1, p2 :: NonAlternatingTangle
        src = rotateTangle 1 $ decodeCascadeCode [(XO, 0), (MU, 0)]
        p1 = implode (0, [(0, 1), (0, 0), (0, 3), (0, 2), (0, 5), (0, 4)], [])
        p2 = implode (0, [(0, 3), (0, 2), (0, 1), (0, 0), (0, 5), (0, 4)], [])
    in putFigures
        [ (Width 32, drawKnot drawOpts src)
        , (Width 32, drawKnot drawOpts $ rotateTangle 1 p1)
        , (Width 32, drawKnot drawOpts $ rotateTangle 5 p2)
        , (Width 32, drawKnot drawOpts p2)
        , (Width 32, drawKnot drawOpts p1)
        ]
