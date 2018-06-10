module TodoList.Msg exposing (..)

import Todo.Model exposing (TodoIdentifier)
import Todo.Msg as Todo exposing (Msg)


type Msg
    = AddTodo TodoIdentifier String
    | DeleteTodo TodoIdentifier
    | DeleteCompletedTodos
    | MsgForTodo TodoIdentifier Todo.Msg
