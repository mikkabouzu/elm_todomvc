module Todos.List exposing (..)

import Todos.Show
import Models exposing (Todo)
import Filter.Model exposing (DisplayMode)
import Messages exposing (Msg)
import Html.Keyed as Keyed
import Html exposing (Html, ul)
import Html.Attributes exposing (class)
import Todos.Helpers exposing (filtered)


view : DisplayMode -> List Todo -> Html Msg
view displayMode todos =
    Keyed.ul [ class "todo-list" ] <|
        filtered displayMode
            >> List.map Todos.Show.view
        <|
            todos
