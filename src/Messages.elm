module Messages exposing (..)

import Models exposing (Todo, FilterState)


type Msg
    = AddTodo
    | UpdateTodoTitle String
    | UpdateTodoCompleted Todo Bool
    | RemoveTodo Todo
    | ClearCompletedTodos
    | FilterTodos FilterState
