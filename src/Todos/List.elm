module Todos.List exposing (..)

import Todos.Show
import Models exposing (Todo, FilterState)
import Messages exposing (Msg)
import Html.Keyed as Keyed
import Html exposing (Html, ul)
import Html.Attributes exposing (class)
import Todos.Helpers exposing (filtered)


view : FilterState -> List Todo -> Html Msg
view filter todos =
    Keyed.ul [ class "todo-list" ] <|
        filtered filter
            >> List.map Todos.Show.view
        <|
            todos
