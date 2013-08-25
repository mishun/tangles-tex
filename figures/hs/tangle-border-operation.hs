module Main where

import Control.Arrow (second)
import Diagrams.Prelude
import Math.KnotTh.Tangle.Projection
import Math.KnotTh.Tangle.CascadeCode
import Figures


main :: IO ()
main = putFigures' $ do
    (tag, (code, (alpha, beta))) <- zip [1 ..]
        [ ([(X, 0), (M, 0), (M, 4), (X, 0), (W, 1)], (-0.06, 0.06))
        , ([(X, 0), (M, 1), (X, 0), (X, 0), (X, 7)], (-1 / 12 - 0.03, 1 / 12 + 0.03))
        , ([(M, 0), (W, 1), (X, 3), (X, 0), (M, 0)], (-0.2, 0.2))
        ]

    let prefix = take (length code - 1) code
        (lastType, lastOffset) = last code

        postTangle = decodeCascadeCode code
        preTangle = rotateTangle (-lastOffset) $ decodeCascadeCode prefix

    let rotationF = case lastType of
            X -> rotateBy $ -1 / (2 * fromIntegral (numberOfLegs preTangle))
            _ -> id

    map (second $ scale 12)
        [ let polar r x =
                  let x' = 2 * pi * x
                  in r2 (r * cos x', r * sin x')

              a = polar 1 alpha

              s r x = polar r x ^-^ a

              b = s 1 beta

              bz =
                  let d = 0.3
                  in bezier3 (s d alpha) (s d beta) b

              brd = fromSegments [bz] # translate a # borderF # borderDashing

              high = fromSegments [bz, straight $ r2 (1, 1) ^-^ a ^-^ b, straight $ r2 (0, -2)]
                  # translate a # lw 0 # fc highColour # clipBy (circle 1)

          in (10 * tag + 1, brd <> rotationF (drawKnotSch postTangle) <> high)

        , (10 * tag + 2, rotationF $ drawKnotSch preTangle)
        ]
