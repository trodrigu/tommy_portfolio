port module Scroller exposing (..)

import Scroll exposing (Move)

port scroll : (Move -> msg) -> Sub msg
