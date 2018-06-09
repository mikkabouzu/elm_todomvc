module Models exposing (..)


type alias TodoIdentifier =
    Int


type alias Todo =
    { title : String
    , completed : Bool
    , editing : Bool
    , identifier : TodoIdentifier
    }


type FilterState
    = All
    | Active
    | Completed


type alias Model =
    { todos : List Todo
    , todo : Todo
    , filter : FilterState
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
    , filter = All
    , nextTodoIdentifier = 2
    }
