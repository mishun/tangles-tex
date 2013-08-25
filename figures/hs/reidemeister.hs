module Main where

import Data.Function (fix)
import Control.Arrow (second)
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let polar r phi = r2 (r * cos phi, r * sin phi)

        put path = path # threadF <>
            path # lc backColour # lw (4 * threadWidth)

        interpolate x y a = ((1 - a) *^ x) ^+^ (a *^ y)

        chain (h : t) = translate h $ fromOffsets $
            flip fix (h, t) $ \ f (base, list) ->
                case list of
                    x : rest -> (x ^-^ base) : f (x, rest)
                    []       -> []

        curve (h : t) = translate h $ fromSegments $
            flip fix (h, t) $ \ f (base, list) ->
                case list of
                    a : b : c : rest -> bezier3 (a ^-^ base) (b ^-^ base) (c ^-^ base) : f (c, rest)
                    _                -> []

    in putFigures' $ map (second $ scale 4)
        [ (31,
            let [z1, z2, z3] = map (polar 0.6 . (+ pi / 2)) [0, 2 * pi / 3, -2 * pi / 3]
            in mconcat $ map (put . chain . flip map [-0.6, 1.6] . uncurry interpolate)
                [ (z2, z3), (z1, z3), (z1, z2) ]
          )

        , (32,
            let [z1, z2, z3] = map (polar 0.6 . (+ 3 * pi / 2)) [0, 2 * pi / 3, -2 * pi / 3]
            in mconcat $ map (put . chain . flip map [-0.6, 1.6] . uncurry interpolate)
                [ (z2, z3), (z1, z3), (z1, z2) ]
          )

        , (21,
            let x = 0.8 ; y = 0.6
                c = curve $ map r2 [(-1, -1), (x, -y), (x, y), (-1, 1)]
            in put c # reflectX <> put c
          )

        , (22,
            let x = -0.3 ; y = 0.5
                c = curve $ map r2 [(-1, -1), (x, -y), (x, y), (-1, 1)]
            in put c <> put c # reflectX
          )

        , (11,
            let p = 0.8 ; t = 1.2 ; x = -0.5 ; y = -0.5
                c = curve $ map r2 [(-1, -1), (x, y), (p, t), (p, 0)]
            in put c <> put c # reflectY
          )

        , (12,
            let x = -0.4 ; y = 0.4
                c = curve $ map r2 [(-1, -1), (x, -y), (x, y), (-1, 1)]
            in put c
          )
        ]
