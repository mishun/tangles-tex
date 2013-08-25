module Main where

import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let subt = circle 1 # borderF # borderDashing # fc highColour # pad (sqrt 0.5)

    	con = (arc (Deg 45) (Deg 135) <> arc (Deg 225) (Deg 315)) # threadF

    	end =
    	    let s = fromOffsets [r2 (1, 0)] # translateX 1 # threadF
    	    in (s # rotateBy (1 / 8)) <> (s # rotateBy (-1 / 8))

        dots =
            let dot = circle 0.05 # fc threadColour
                st = strutX 0.4
            in hcat [st, st, dot, st, dot, st, dot, st, st]

	cross =
	    let s = fromOffsets [r2 (2, 0)] # translateX (-1) # threadF
	    in (s # rotateBy (1 / 8)) <> (s # rotateBy (-1 / 8))

    in putFigure $ scale 5 $ hcat
        [ reflectX end
        , subt, con, dots, con, subt
        , con
        , cross, con, dots, con, cross
        , end
        ]
