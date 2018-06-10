module Messages exposing (..)

import Models exposing (Todo)
import Filter.Msg as Filter
import Todo.Msg as Todo
import TodoList.Msg as TodoList


type Msg
    = NoOp
    | UpdateTodoCompleted Todo Bool
    | RemoveTodo Todo
    | ClearCompletedTodos
    | MsgForFilter Filter.Msg
    | MsgForTodo Todo.Msg
    | MsgForTodoList TodoList.Msg
