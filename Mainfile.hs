module Main where

import LexAssignment
import ParAssignment 
import ErrM
import SkelAssignment

import System.Environment
import Text.Show.Pretty

main = do
    args <- getArgs
    conts <- readFile (args !! 0)
    let tokens = myLexer conts
    let ptree = pProg tokens
    case ptree of 
        Ok tree -> do
            let ast = transProg tree
            --putStrLn $ show ast
            putStrLn $ ppShow ast
        Bad msg -> putStrLn msg
