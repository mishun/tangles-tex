{-# LANGUAGE FlexibleContexts #-}
module Figures
    ( module X
    , threadF, borderF, altF, borderDashing
    , drawKnotSch
    , putFigure
    , putFigures
    ) where

import Data.List (isSuffixOf)
import System.Environment (getArgs, getProgName)
import Control.Monad (forM_)
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
putFigures diagrams =
    forM_ (diagrams `zip` [1 :: Int ..]) $ \ (diagram, n) ->
        putFigure' (printf "-%i" n) diagram


putFigure :: Diagram Postscript R2 -> IO ()
putFigure = putFigure' ""


putFigure' :: String -> Diagram Postscript R2 -> IO ()
putFigure' tag diagram = do
    pn <- getProgName
    [path] <- getArgs
    
    let fileName = concat
            [ path
            , if "/" `isSuffixOf` path then "" else "/"
            , if ".hs.exe" `isSuffixOf` pn
                then take (length pn - length ".hs.exe") pn
                else pn
            , tag
            , ".mps"
            ]

    let diam = diameter (r2 (1, 0)) diagram
    renderDia Postscript (PostscriptOptions fileName (Width $ 2.83464567 * diam) EPS) diagram
