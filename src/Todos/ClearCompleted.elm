module Todos.ClearCompleted exposing (..)

import Messages exposing (Msg(ClearCompletedTodos))
import Html exposing (Html, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


view : Html Msg
view =
    button
        [ class "clear-completed"
        , onClick ClearCompletedTodos
        ]
        [ text "Clear completed" ]
