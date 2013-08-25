module FigureScheme
    ( backColour, altColour, threadColour, borderColour, textColour, highColour
    , altWidth, threadWidth, borderWidth, arrowWidth
    ) where

import Diagrams.Prelude
import Data.Colour.SRGB


backColour, altColour, threadColour, borderColour, textColour, highColour :: Colour Double
backColour   = sRGB 0.16  0.208 0.318
altColour    = sRGB 0.68  0.790 1.0
threadColour = sRGB 1.0   0.6   0.306
borderColour = sRGB 0.75  0.75  0.75
textColour   = sRGB 0.973 0.808 0.587
highColour   = blend 0.5 altColour backColour


altWidth, threadWidth, borderWidth, arrowWidth :: Double
altWidth    = 0.3
threadWidth = 0.3
borderWidth = 0.2
arrowWidth  = 0.3
