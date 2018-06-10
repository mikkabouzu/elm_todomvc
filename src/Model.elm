module Model exposing (..)

import Filter.Model as Filter exposing (Model, initialModel)
import Todo.Model as Todo exposing (Model, newTodo)
import TodoList.Model as TodoList exposing (Model)


type alias Model =
    { todos : TodoList.Model
    , todo : Todo.Model
    , filter : Filter.Model
    }


initialModel : Model
initialModel =
    { todos =
        [ newTodo 0 "First TODO"
        ]
    , todo = newTodo 1 ""
    , filter = Filter.initialModel
    }
