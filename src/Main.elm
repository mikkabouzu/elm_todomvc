module Main exposing (..)

import Html exposing (program)
import Messages exposing (Msg)
import Model exposing (Model, initialModel)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View.App as App exposing (view)


main : Program Never Model Msg
main =
    program
        { init = ( initialModel, Cmd.none )
        , view = App.view
        , update = update
        , subscriptions = subscriptions
        }
