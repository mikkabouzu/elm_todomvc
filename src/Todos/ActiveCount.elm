module Todos.ActiveCount exposing (view)

import Models exposing (Todo)
import Messages exposing (Msg)
import Html exposing (Html, span, text, strong)
import Html.Attributes exposing (class)
import Todos.Helpers exposing (excludeCompleted)


view : List Todo -> Html Msg
view todos =
    let
        activeTodoCount =
            todos |> excludeCompleted |> List.length
    in
        span [ class "todo-count" ]
            [ strong []
                [ text <| toString <| activeTodoCount ]
            , text " items left"
            ]
