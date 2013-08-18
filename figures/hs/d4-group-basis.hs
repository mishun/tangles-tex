module Main where

import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let bug txt =
            let len = 2.3

                whiskers =
            	    let whisker = fromOffsets [r2 (len, 0)] # translateX 1 # threadF
            	    in mconcat $ map (\ a -> whisker # rotateBy (1 / 8 + a)) [0, 1 / 4, 1 / 2, 3 / 4]

                body = circle 1 # borderF # fc highColour # borderDashing

                marks = mconcat $ map (\ (t, (x, y)) ->
                        let delta a = (len + 1.4) * (a - 0.5) * sqrt 2
                        in alignedText (1 - x) (1 - y) t # fontSize 1 # fc textColour # translate (r2 (delta x, delta y))
                    ) $ txt `zip` [(0, 0), (1, 0), (1, 1), (0, 1)]

            in marks <> whiskers <> body

        l = text "L" # fontSize 1 # fc textColour

    in putFigures $ map (scale 3)
        [ l <> bug ["0", "1", "2", "3"]
        , l # reflectX # rotateBy (-1 / 4) <> bug ["0", "3", "2", "1"]
        , l # rotateBy (-1 / 4) <> bug ["1", "2", "3", "0"]
        ]
