module FigureScheme
    ( backgroundColour, altColour, threadColour, borderColour, textColour, highColour
    , altWidth, threadWidth, borderWidth, arrowWidth
    ) where

import Diagrams.Prelude


backgroundColour, altColour, threadColour, borderColour, textColour, highColour :: Colour Double
backgroundColour = white
altColour        = black    
threadColour     = black
borderColour     = black
textColour       = black
highColour       = blend 0.8 white black


altWidth, threadWidth, borderWidth, arrowWidth :: Double
altWidth    = 0.03
threadWidth = 0.03
borderWidth = 0.02
arrowWidth  = 0.03
