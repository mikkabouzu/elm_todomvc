module Todo.Update exposing (..)

import Messages as Main exposing (Msg(MsgForTodo, MsgForTodoList))
import Todo.Model exposing (Model, newTodo)
import Todo.Msg as Todo exposing (..)
import TodoList.Msg as TodoList exposing (Msg(AddTodo))


update : Main.Msg -> Model -> Model
update msg model =
    case msg of
        MsgForTodo msgForTodo ->
            updateTodo msgForTodo model

        MsgForTodoList (AddTodo prevId _) ->
            newTodo (prevId + 1) ""

        _ ->
            model


updateTodo : Todo.Msg -> Model -> Model
updateTodo msgForTodo model =
    case msgForTodo of
        Check completedOrNot ->
            { model | completed = completedOrNot }

        UpdateTitle newTitle ->
            { model | title = newTitle }
