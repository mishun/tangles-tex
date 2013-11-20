module Main where

import Data.Function (fix)
import Control.Arrow (second)
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let put path = path # threadF <>
            path # lc backColour # lw (4 * threadWidth)

        curve (h : t) = translate h $ fromSegments $
            flip fix (h, t) $ \ f (base, list) -> case list of
                a : b : c : rest -> bezier3 (a ^-^ base) (b ^-^ base) (c ^-^ base) : f (c, rest)
                _                -> []

	basic =
	    let body = text "T" # fontSize 1 # fc textColour <>
                    circle 1 # borderF # borderDashing # fc highColour

                wires =
                    let tails = 3
                        phi = 30 * (pi / 180)
                        w = put $ fromVertices [p2 (-tails, sin phi), p2 (tails, sin phi)]
                    in w <> w # reflectY

            in body <> wires

        d = 2

        cut =
            let u = 1.5
            in put $ fromVertices [p2 (d, -u), p2 (d, u)]

        loop =
            let u = 2.2
            in put $ curve
                [ r2 (0, 1)
                , r2 (0, u), r2 (d, u), r2 (d, 0.7)
                , r2 (d, 0), r2 (d, 0), r2 (d, -0.7)
                , r2 (d, -u), r2 (0, -u), r2 (0, -1)
                ]

    in putFigures' $ map (second $ scale 4) $
        [ (11, basic <> reflectX cut)
        , (12, basic <> cut)
        , (21, basic <> reflectX loop)
        , (22, basic <> loop)
        ]
