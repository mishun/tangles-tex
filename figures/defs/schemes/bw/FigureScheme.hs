module FigureScheme
    ( backColour, altColour, threadColour, borderColour, textColour, highColour
    , altWidth, threadWidth, borderWidth, arrowWidth
    ) where

import Diagrams.Prelude


backColour, altColour, threadColour, borderColour, textColour, highColour :: Colour Double
backColour   = white
altColour    = black
threadColour = black
borderColour = black
textColour   = black
highColour   = blend 0.8 white black


altWidth, threadWidth, borderWidth, arrowWidth :: Double
altWidth    = 0.4
threadWidth = 0.4
borderWidth = 0.2
arrowWidth  = 0.4
