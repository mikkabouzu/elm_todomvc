module Todos.List exposing (..)

import Todos.Show
import Models exposing (Todo)
import Messages exposing (Msg)
import Html exposing (Html, ul)
import Html.Attributes exposing (class)


view : List Todo -> Html Msg
view todos =
    ul [ class "todo-list" ] (List.map Todos.Show.view todos)
