module Main where

import Control.Monad.Writer
import Math.KnotTh.Tangle.BorderIncremental.FlypeGenerator
import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let tangles = execWriter $
            generateFlypeEquivalent 4 $ \ tangle _ ->
                tell [tangle]

    in putFigures
        [ hcat $ map (\ t -> drawKnotSch t # scale 8) tangles
        ]
