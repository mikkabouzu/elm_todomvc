module View exposing (..)

import Models exposing (Model)
import Messages exposing (Msg)
import Html exposing (Html, div, header, h1, section, text, footer)
import Html.Attributes exposing (class)
import Todos.New
import Todos.List
import Filters.List


view : Model -> Html Msg
view model =
    div [ class "todoapp" ]
        [ header [ class "header" ]
            [ h1 [] [ text "todos" ] ]
        , section [ class "main" ]
            [ Todos.New.view model.todo
            , Todos.List.view model.filter model.todos
            ]
        , footer [ class "footer" ]
            [ Filters.List.view model.filter ]
        ]
