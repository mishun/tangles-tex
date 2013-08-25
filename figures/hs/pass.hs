module Main where

import Data.Function (fix)
import Control.Arrow (second)
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let put path = path # threadF <>
            path # lc backColour # lw (4 * threadWidth)

        chain (h : t) = translate h $ fromOffsets (map (^-^ h) t)

        curve (h : t) = translate h $ fromSegments $
            flip fix (h, t) $ \ f (base, list) -> case list of
                a : b : c : rest -> bezier3 (a ^-^ base) (b ^-^ base) (c ^-^ base) : f (c, rest)
                _                -> []

        body = text "T" # fontSize 1 # fc textColour <>
            circle 1 # borderF # borderDashing # fc highColour

        wires =
            let tails = 3
                phi = 30 * (pi / 180)
                w = put $ chain [r2 (-tails, sin phi), r2 (tails, sin phi)]
            in w <> w # reflectY

        offset = 2

    in putFigures' $ map (second $ scale 4) $
        [ (11,
            body <> wires <> (put $ chain [r2 (-offset, -1.5), r2 (-offset, 1.5)])
          )

        , (12,
            body <> wires <> (put $ chain [r2 (offset, -1.5), r2 (offset, 1.5)])
          )

        , (21,
            let u = 2.2
            in body <> wires <> (put $ curve
                [ r2 (0, 1)
                , r2 (0, u), r2 (-offset, u), r2 (-offset, 0.7)
                , r2 (-offset, 0), r2 (-offset, 0), r2 (-offset, -0.7)
                , r2 (-offset, -u), r2 (0, -u), r2 (0, -1)
                ])
          )

        , (22,
            let u = 2.2
            in body <> wires <> (put $ curve
                [ r2 (0, 1)
                , r2 (0, u), r2 (offset, u), r2 (offset, 0.7)
                , r2 (offset, 0), r2 (offset, 0), r2 (offset, -0.7)
                , r2 (offset, -u), r2 (0, -u), r2 (0, -1)
                ])
          )
        ]
