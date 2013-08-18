module Main where

import Data.Function (fix, on)
import Data.Maybe (mapMaybe)
import Data.List (splitAt, groupBy, sortBy)
import Math.KnotTh.Tangle.NonAlternating
import Math.KnotTh.Enumeration.DiagramInfo.MinimalDiagramInfo
import Math.KnotTh.Enumeration.Applied.NonAlternatingTangles
import Diagrams.Prelude
import Figures


main :: IO ()
main = 
    let drawGroup g =
            let lines = flip fix g $ \ f list ->
                    case list of
                        [] -> []
                        _  -> let (h, t) = splitAt 10 list in h : f t

                sp = 0.5
                pr = 0.6

                prefix = case length lines - 1 of
                    0 -> strutX sp
                    n -> fromOffsets [r2 (-(sp * pr), 0), r2 (0, -(2 + sp) * fromIntegral n), r2 (sp * pr, 0)] # altF
                        ||| strutX (sp * (1 - pr))

                content = vcat' with { sep = sp } $ map (hcat' with { sep = sp }) lines

            in prefix ||| content

    in putFigures $ map (scale 6 . drawGroup . map drawKnotSch) $
        let key t = (numberOfCrossings t, numberOfLegs t)
        in groupBy (on (==) key) $ sortBy (on compare key) $
            filter (not . isAlternating) $ mapMaybe maybePrimeDiagram $ singleRepresentativeClasses $
                lookingForwardTanglesEnumeration False 10 0 5
