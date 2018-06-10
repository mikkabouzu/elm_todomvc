module View exposing (..)

import Models exposing (Model)
import Messages exposing (Msg)
import Html exposing (Html, div, header, h1, section, text, footer)
import Html.Attributes exposing (class)
import Todos.List
import Todos.ClearCompleted
import Todos.ActiveCount
import Filter.View.Filters as Filters
import Todo.View.NewTodo as NewTodo


view : Model -> Html Msg
view model =
    div [ class "todoapp" ]
        [ header [ class "header" ]
            [ h1 [] [ text "todos" ] ]
        , section [ class "main" ]
            [ NewTodo.view model.todo
            , Todos.List.view model.filter.display model.todos
            ]
        , footer [ class "footer" ]
            [ Todos.ActiveCount.view model.todos
            , Filters.view model.filter.display
            , Todos.ClearCompleted.view
            ]
        ]
