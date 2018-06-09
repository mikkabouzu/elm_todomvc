module Todos.New exposing (view)

import Models exposing (Todo)
import Messages exposing (Msg(AddTodo, UpdateTodoTitle))
import Html exposing (Html, Attribute, input)
import Html.Attributes exposing (class, placeholder, autofocus, value)
import Events exposing (onEnter)
import Html.Events exposing (onInput)


view : Todo -> Html Msg
view todo =
    input
        [ class "new-todo"
        , placeholder "What needs to be done?"
        , autofocus True
        , onInput UpdateTodoTitle
        , onEnter AddTodo
        , value todo.title
        ]
        []
