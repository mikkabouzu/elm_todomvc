module Models exposing (..)


type alias Todo =
    { title : String
    , completed : Bool
    , editing : Bool
    }


type FilterState
    = All
    | Active
    | Completed


type alias Model =
    { todos : List Todo
    , todo : Todo
    , filter : FilterState
    }


blankTodo : Todo
blankTodo =
    { title = ""
    , completed = False
    , editing = False
    }


initialModel : Model
initialModel =
    { todos =
        [ { title = "First TODO"
          , completed = True
          , editing = False
          }
        ]
    , todo = blankTodo
    , filter = All
    }
