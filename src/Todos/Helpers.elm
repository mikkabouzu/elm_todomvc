module Todos.Helpers exposing (..)

import Models exposing (TodoIdentifier, Todo, FilterState(..))


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


remove : TodoIdentifier -> List Todo -> List Todo
remove identifier todos =
    List.filter (\todo -> todo.identifier /= identifier) todos


filtered : FilterState -> List Todo -> List Todo
filtered filterState todos =
    let
        criteria =
            case filterState of
                All ->
                    always True

                Active ->
                    not << .completed

                Completed ->
                    .completed
    in
        todos |> List.filter criteria
