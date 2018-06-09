module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, blankTodo)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTodo title ->
            let
                todo =
                    model.todo

                updatedTodo =
                    { todo | title = title }
            in
                ( { model | todo = updatedTodo }, Cmd.none )

        AddTodo ->
            ( { model | todo = blankTodo, todos = model.todo :: model.todos }, Cmd.none )

        Complete todo ->
            ( model, Cmd.none )

        Delete todo ->
            ( model, Cmd.none )

        Filter filterstate ->
            ( model, Cmd.none )
