module Filter.Update exposing (update)

import Filter.Model exposing (Model)
import Filter.Msg as Filter exposing (..)
import Messages as Main exposing (Msg(MsgForFilter))


update : Main.Msg -> Model -> Model
update msg model =
    case msg of
        MsgForFilter msgForFilter ->
            updateFilter msgForFilter model

        _ ->
            model


updateFilter : Filter.Msg -> Model -> Model
updateFilter msg model =
    case msg of
        ChangeDisplay displayMode ->
            { model | display = displayMode }
