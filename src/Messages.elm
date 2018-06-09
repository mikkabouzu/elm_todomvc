module Messages exposing (..)

import Models exposing (TodoIdentifier, Todo, FilterState)


type Msg
    = AddTodo
    | Complete Todo
    | Delete Todo
    | UpdateTodo String
    | UpdateTodoCompleted TodoIdentifier Bool
    | RemoveTodo TodoIdentifier
    | Filter FilterState
