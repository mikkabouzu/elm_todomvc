module Todos.Show exposing (..)

import Models exposing (Todo)
import Messages exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Todo -> Html Msg
view todo =
    li [ classList [ ( "completed", todo.completed ) ] ]
        [ div [ class "view" ]
            [ input [ class "toggle", type_ "checkbox", checked todo.completed ] []
            , label [] [ text todo.title ]
            , button [ class "destroy" ] []
            ]
        ]
