module Models exposing (..)

import Filter.Model as Filter exposing (Model, initialModel)


type alias TodoIdentifier =
    Int


type alias Todo =
    { title : String
    , completed : Bool
    , editing : Bool
    , identifier : TodoIdentifier
    }


type alias Model =
    { todos : List Todo
    , todo : Todo
    , filter : Filter.Model
    , nextTodoIdentifier : Int
    }


blankTodo : Todo
blankTodo =
    { title = ""
    , completed = False
    , editing = False
    , identifier = 0
    }


initialModel : Model
initialModel =
    { todos =
        [ { title = "First TODO"
          , completed = True
          , editing = False
          , identifier = 1
          }
        ]
    , todo = blankTodo
    , filter = Filter.initialModel
    , nextTodoIdentifier = 2
    }
