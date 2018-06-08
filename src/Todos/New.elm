module Todos.New exposing (..)

import Messages exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Html Msg
view =
    input [ class "new-todo", placeholder "What needs to be done?", autofocus True ] []
