module TodoList.Update exposing (..)

import Messages as Main exposing (Msg(MsgForTodoList))
import Todo.Model exposing (TodoIdentifier, newTodo)
import Todo.Msg as Todo exposing (Msg)
import Todo.Update as Todo exposing (updateTodo)
import TodoList.Model exposing (Model)
import TodoList.Msg as TodoList exposing (..)


update : Main.Msg -> Model -> Model
update msg model =
    case msg of
        MsgForTodoList msgForTodoList ->
            updateTodoList msgForTodoList model

        _ ->
            model


updateTodoList : TodoList.Msg -> Model -> Model
updateTodoList msg model =
    case msg of
        AddTodo todoIdentifier todoTitle ->
            (newTodo todoIdentifier todoTitle) :: model

        DeleteTodo todoIdentifier ->
            List.filter (\todo -> todo.identifier /= todoIdentifier) model

        DeleteCompletedTodos ->
            List.filter (not << .completed) model

        MsgForTodo todoIdentifier msgForTodo ->
            updateSpecificTodo todoIdentifier msgForTodo model


updateSpecificTodo : TodoIdentifier -> Todo.Msg -> Model -> Model
updateSpecificTodo todoIdentifier msgForTodo model =
    let
        updateTodo todo =
            if todo.identifier == todoIdentifier then
                Todo.updateTodo msgForTodo todo
            else
                todo
    in
        List.map updateTodo model
