module Todos.New exposing (..)

import Messages exposing (Msg)
import Html exposing (Html, input)
import Html.Attributes exposing (class, placeholder, autofocus)


view : Html Msg
view =
    input [ class "new-todo", placeholder "What needs to be done?", autofocus True ] []
