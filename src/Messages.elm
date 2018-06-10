module Messages exposing (..)

import Models exposing (Todo)
import Filter.Msg as Filter


type Msg
    = AddTodo
    | UpdateTodoTitle String
    | UpdateTodoCompleted Todo Bool
    | RemoveTodo Todo
    | ClearCompletedTodos
    | MsgForFilter Filter.Msg
