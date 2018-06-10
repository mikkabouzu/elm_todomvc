module Todo.Model exposing (..)


type alias TodoIdentifier =
    Int


type alias Model =
    { identifier : TodoIdentifier
    , title : String
    , completed : Bool
    , editing : Bool
    }


newTodo : TodoIdentifier -> String -> Model
newTodo id title =
    { identifier = id
    , title = title
    , completed = False
    , editing = False
    }


initialModel : Model
initialModel =
    newTodo 0 ""
