module Todos.Helpers exposing (..)

import Models exposing (TodoIdentifier, Todo)
import Filter.Model as DisplayMode exposing (DisplayMode)


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


filtered : DisplayMode -> List Todo -> List Todo
filtered displayMode todos =
    let
        criteria =
            case displayMode of
                DisplayMode.All ->
                    always True

                DisplayMode.Active ->
                    not << .completed

                DisplayMode.Completed ->
                    .completed
    in
        todos |> List.filter criteria
