module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add todo ->
            ( model, Cmd.none )

        Complete todo ->
            ( model, Cmd.none )

        Delete todo ->
            ( model, Cmd.none )

        Filter filterstate ->
            ( model, Cmd.none )
