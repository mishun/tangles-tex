module FigureScheme
    ( backColour, altColour, threadColour, borderColour, textColour, highColour
    , altWidth, threadWidth, borderWidth, arrowWidth
    ) where

import Diagrams.Prelude
import Data.Colour.SRGB.Linear


backColour, altColour, threadColour, borderColour, textColour, highColour :: Colour Double
backColour   = rgb 0.16  0.208 0.318
altColour    = rgb 0.68  0.790 1.0
threadColour = rgb 1.0   0.6   0.306
borderColour = rgb 0.75  0.75  0.75
textColour   = rgb 0.973 0.808 0.587
highColour   = blend 0.5 altColour backColour


altWidth, threadWidth, borderWidth, arrowWidth :: Double
altWidth    = 0.4
threadWidth = 0.4
borderWidth = 0.2
arrowWidth  = 0.4
