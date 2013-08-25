{-# LANGUAGE FlexibleContexts #-}
module Figures
    ( module X
    , threadF, borderF, altF, borderDashing
    , drawKnotSch
    , putFigures
    , putFigures'
    , putFigure
    ) where

import Data.List (isSuffixOf)
import System.Environment (getArgs, getProgName)
import Text.Printf
import Diagrams.Prelude
import Diagrams.Backend.Postscript
import qualified Math.KnotTh.Draw.DrawKnot as D
import FigureScheme as X


borderDash :: [Double]
borderDash = [5 * borderWidth, 4 * borderWidth]


threadF, borderF, altF, borderDashing :: (HasStyle d) => d -> d
threadF = lc threadColour . lw threadWidth
borderF = lc borderColour . lw borderWidth
altF    = lc altColour . lw altWidth
borderDashing = dashing borderDash 0


drawKnotSch :: (D.DrawableKnotted k, D.DrawableCrossingType ct, Renderable (Path R2) b) => k ct -> Diagram b R2
drawKnotSch = D.drawKnot D.defaultDraw
    { D.threadWidth      = threadWidth
    , D.threadColour     = threadColour
    , D.borderWidth      = borderWidth
    , D.borderColour     = borderColour
    , D.backgroundColour = backColour
    , D.borderDashing    = borderDash
    , D.endpointsRadius  = 0
    }


putFigures :: [Diagram Postscript R2] -> IO ()
putFigures = putFigures' . zip [1 ..]


putFigures' :: [(Int, Diagram Postscript R2)] -> IO ()
putFigures' =
    mapM_ $ \ (tag, diagram) ->
        writeFigure (printf "-%i" tag) diagram


putFigure :: Diagram Postscript R2 -> IO ()
putFigure = writeFigure ""


writeFigure :: String -> Diagram Postscript R2 -> IO ()
writeFigure tag diagram = do
    fileName <- do
        pn <- getProgName
        [path] <- getArgs
        return $ printf "%s/%s%s.mps"
            path
            (if ".hs.exe" `isSuffixOf` pn
                then take (length pn - length ".hs.exe") pn
                else pn
            )
            tag

    let diam = diameter (r2 (1, 0)) diagram
    renderDia
        Postscript
        (PostscriptOptions fileName (Width $ 2.83464567 * diam) EPS)
        diagram
