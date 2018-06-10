module TodoList.View.ClearCompleted exposing (..)

import Messages as Main exposing (Msg(MsgForTodoList))
import TodoList.Msg as TodoList exposing (Msg(DeleteCompletedTodos))
import Html exposing (Html, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


view : Html Main.Msg
view =
    button
        [ class "clear-completed"
        , onClick (MsgForTodoList DeleteCompletedTodos)
        ]
        [ text "Clear completed" ]
