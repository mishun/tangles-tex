module Main where

import Control.Monad.Writer (execWriter, tell)
import Control.Monad (forM_)
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    putFigure $ scale 20 $ execWriter $ do
        tell $ circle 1 # borderF # borderDashing

        let polar i = let a = 2 * pi * fromIntegral i / 8
                      in r2 (cos a, sin a)

        forM_ [0 .. 7] $ \ i -> do
            let p = polar i
            tell $ text (show i) # fontSize 0.2 # fc textColour # translate (1.2 *^ p)
            tell $ circle 0.02 # lw 0 # fc borderColour # translate p

        let curve a b c d =
                fromSegments [bezier3 (b ^-^ a) (c ^-^ a) (d ^-^ a)]
                    # translate a

        let chord i j =
                let a = polar i
                    b = polar j
                    r = 0.4
                in curve (a) (r *^ a) (r *^ b) (b) # threadF

        mapM_ (tell . uncurry chord)
            [(0, 6), (1, 3), (2, 5), (4, 7)]
