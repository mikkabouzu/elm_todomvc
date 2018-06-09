module Messages exposing (..)

import Models exposing (Todo, FilterState)


type Msg
    = AddTodo
    | Complete Todo
    | Delete Todo
    | UpdateTodo String
    | UpdateTodoCompleted Todo Bool
    | RemoveTodo Todo
    | Filter FilterState
