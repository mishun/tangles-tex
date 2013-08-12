module FigureScheme
    ( backgroundColour, altColour, threadColour, borderColour, textColour, highColour
    , altWidth, threadWidth, borderWidth, arrowWidth
    ) where

import Diagrams.Prelude
import Data.Colour.SRGB.Linear


backgroundColour, altColour, threadColour, borderColour, textColour, highColour :: Colour Double
backgroundColour = rgb 0.16  0.208 0.318
altColour        = rgb 0.68  0.790 1.0    
threadColour     = rgb 1.0   0.6   0.306
borderColour     = rgb 0.75  0.75  0.75
textColour       = rgb 0.973 0.808 0.587
highColour       = blend 0.5 altColour backgroundColour


altWidth, threadWidth, borderWidth, arrowWidth :: Double
altWidth    = 0.03
threadWidth = 0.03
borderWidth = 0.02
arrowWidth  = 0.03
