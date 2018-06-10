module Update exposing (update)

import Messages exposing (Msg)
import Model exposing (Model)
import Todo.Update as Todo
import TodoList.Update as TodoList
import Filter.Update as Filter


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( { model
        | todo = Todo.update msg model.todo
        , todos = TodoList.update msg model.todos
        , filter = Filter.update msg model.filter
      }
    , Cmd.none
    )
