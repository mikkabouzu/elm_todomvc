module Todos.Show exposing (..)

import Models exposing (Todo)
import Messages exposing (Msg(UpdateTodoCompleted))
import Html exposing (Html, li, div, input, label, button, text)
import Html.Attributes exposing (classList, class, type_, checked)
import Html.Events exposing (onCheck)


view : Todo -> Html Msg
view todo =
    li [ classList [ ( "completed", todo.completed ) ] ]
        [ div [ class "view" ]
            [ input
                [ class "toggle"
                , type_ "checkbox"
                , checked todo.completed
                , onCheck (UpdateTodoCompleted todo.identifier)
                ]
                []
            , label [] [ text todo.title ]
            , button [ class "destroy" ] []
            ]
        ]
