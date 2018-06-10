module Filter.Model exposing (..)


type DisplayMode
    = All
    | Completed
    | Active


type alias Model =
    { display : DisplayMode }


initialModel : Model
initialModel =
    { display = All }
