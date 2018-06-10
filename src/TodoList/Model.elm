module TodoList.Model exposing (..)

import Todo.Model as Todo exposing (Model)


type alias Model =
    List Todo.Model


initialModel : Model
initialModel =
    []
