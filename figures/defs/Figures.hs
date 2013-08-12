module Figures
    ( putFigure
    , putFigures
    ) where

import Data.List (isSuffixOf)
import System.Environment (getArgs, getProgName)
import Control.Monad (forM_)
import Text.Printf
import Diagrams.Prelude
import Diagrams.Backend.Postscript


putFigures :: [(SizeSpec2D, Diagram Postscript R2)] -> IO ()
putFigures diagrams =
    forM_ (diagrams `zip` [1 :: Int ..]) $ \ (diagram, n) ->
        putFigure' (printf "-%i" n) diagram


putFigure :: (SizeSpec2D, Diagram Postscript R2) -> IO ()
putFigure = putFigure' ""


putFigure' :: String -> (SizeSpec2D, Diagram Postscript R2) -> IO ()
putFigure' tag (sz, diagram) = do
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

    renderDia Postscript (PostscriptOptions fileName sz EPS) diagram
