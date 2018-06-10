module TodoList.View.ActiveCount exposing (view)

import TodoList.Model as TodoList exposing (Model)
import Messages exposing (Msg)
import Html exposing (Html, span, text, strong)
import Html.Attributes exposing (class)


view : TodoList.Model -> Html Msg
view todos =
    span [ class "todo-count" ]
        [ strong []
            [ text <| toString <| activeTodoCount todos ]
        , text " items left"
        ]


activeTodoCount : TodoList.Model -> Int
activeTodoCount todos =
    todos |> List.filter (not << .completed) |> List.length
