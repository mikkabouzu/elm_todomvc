module Messages exposing (..)

import Todo.Msg as Todo
import TodoList.Msg as TodoList
import Filter.Msg as Filter


type Msg
    = NoOp
    | MsgForTodo Todo.Msg
    | MsgForTodoList TodoList.Msg
    | MsgForFilter Filter.Msg
