module Todos.Helpers exposing (..)

import Models exposing (TodoIdentifier, Todo)


updateCompleted : TodoIdentifier -> Bool -> List Todo -> List Todo
updateCompleted identifier completeOrNot todos =
    let
        updateTodo todo =
            if todo.identifier == identifier then
                { todo | completed = completeOrNot }
            else
                todo
    in
        List.map updateTodo todos
