module Events exposing (..)

import Messages exposing (Msg)
import Json.Decode as Json
import Html.Events exposing (on, keyCode)
import Html exposing (Attribute)


onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Json.succeed msg
            else
                Json.fail "not enter"
    in
        on "keydown" (keyCode |> Json.andThen isEnter)
