module TodoList.Msg exposing (..)

import Todo.Model exposing (TodoIdentifier)


type Msg
    = AddTodo TodoIdentifier String
