module View exposing (..)

import Models exposing (Model)
import Messages exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)
import Todos.New
import Todos.List


view : Model -> Html Msg
view model =
    div [ class "todoapp" ]
        [ header [ class "header" ]
            [ h1 [] [ text "todos" ] ]
        , section [ class "main" ]
            [ Todos.New.view
            , Todos.List.view model.todos
            ]
        ]
