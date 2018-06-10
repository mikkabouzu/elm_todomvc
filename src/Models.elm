module Models exposing (..)

import Filter.Model as Filter exposing (Model, initialModel)
import Todo.Model as Todo exposing (Model, TodoIdentifier, newTodo)


type alias TodoIdentifier =
    -- hack for now
    Todo.TodoIdentifier


type alias Todo =
    -- hack for now
    Todo.Model


type alias Model =
    { todos : List Todo.Model
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
