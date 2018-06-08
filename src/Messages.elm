module Messages exposing (..)

import Models exposing (Todo, FilterState)


type Msg
    = Add Todo
    | Complete Todo
    | Delete Todo
    | Filter FilterState
