module Todos.Helpers exposing (..)

import Models exposing (TodoIdentifier, Todo, FilterState(..))


isValid : Todo -> Bool
isValid todo =
    not <| String.isEmpty todo.title


updateCompleted : TodoIdentifier -> Bool -> List Todo -> List Todo
updateCompleted identifier completeOrNot todos =
    let
        updateCompleted todo =
            if todo.identifier == identifier then
                { todo | completed = completeOrNot }
            else
                todo
    in
        todos |> List.map updateCompleted


remove : TodoIdentifier -> List Todo -> List Todo
remove identifier todos =
    let
        toBeRemoved todo =
            todo.identifier == identifier
    in
        todos |> List.filter (not << toBeRemoved)


excludeCompleted : List Todo -> List Todo
excludeCompleted todos =
    todos |> List.filter (not << .completed)


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
