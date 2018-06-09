module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, blankTodo)
import Todos.Helpers exposing (isValid, updateCompleted, remove)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTodoTitle title ->
            let
                todo =
                    model.todo

                updatedTodo =
                    { todo | title = title }
            in
                ( { model | todo = updatedTodo }, Cmd.none )

        AddTodo ->
            let
                todo =
                    model.todo

                todoToAdd =
                    { todo | identifier = model.nextTodoIdentifier }
            in
                if todo |> isValid then
                    ( { model
                        | todo = blankTodo
                        , todos = todoToAdd :: model.todos
                        , nextTodoIdentifier = model.nextTodoIdentifier + 1
                      }
                    , Cmd.none
                    )
                else
                    ( model, Cmd.none )

        UpdateTodoCompleted todo completedOrNot ->
            ( { model
                | todos = model.todos |> updateCompleted todo.identifier completedOrNot
              }
            , Cmd.none
            )

        RemoveTodo todo ->
            ( { model
                | todos = model.todos |> remove todo.identifier
              }
            , Cmd.none
            )

        FilterTodos filter ->
            ( { model | filter = filter }, Cmd.none )
