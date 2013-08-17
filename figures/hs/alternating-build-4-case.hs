module Main where

import Diagrams.Prelude
import Figures


main :: IO ()
main =
    let subt = circle 1 # borderF # fc highColour # pad (sqrt 0.5)

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

        brd = circle 2 # scaleX 2.4 # borderF # borderDashing

        put a b c =
            let center' = (con ||| dots ||| con) # centerXY
                center = (center' <> brd) # withEnvelope center'
            in hcat [end # reflectX, a, center, b, con, c, end] # scale 2

    in putFigures $ map ((===) $ strutY 5)
        [ put subt cross cross
        , put cross cross cross
        , put subt subt cross
        , put cross subt cross
        , put subt cross subt
        , put cross cross subt
        , put subt subt subt
        , put cross subt subt
        ]
