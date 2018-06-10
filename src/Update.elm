module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, Todo, blankTodo)
import Todos.Helpers exposing (isValid, excludeCompleted, updateCompleted, remove)
import Filter.Update as Filter


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateTodoTitle title ->
            ( updateTodo title model
            , Cmd.none
            )

        AddTodo ->
            ( addTodo model
            , Cmd.none
            )

        UpdateTodoCompleted todo completedOrNot ->
            ( updateTodoCompleted todo completedOrNot model
            , Cmd.none
            )

        RemoveTodo todo ->
            ( removeTodo todo model
            , Cmd.none
            )

        ClearCompletedTodos ->
            ( clearCompletedTodos model
            , Cmd.none
            )

        MsgForFilter msgForFilter ->
            ( { model | filter = Filter.update (MsgForFilter msgForFilter) model.filter }
            , Cmd.none
            )


updateTodo : String -> Model -> Model
updateTodo title model =
    let
        todo =
            model.todo

        updatedTodo =
            { todo | title = title }
    in
        { model | todo = updatedTodo }


addTodo : Model -> Model
addTodo model =
    let
        todo =
            model.todo

        todoToAdd =
            { todo | identifier = model.nextTodoIdentifier }
    in
        if todo |> isValid then
            { model
                | todo = blankTodo
                , todos = todoToAdd :: model.todos
                , nextTodoIdentifier = model.nextTodoIdentifier + 1
            }
        else
            model


updateTodoCompleted : Todo -> Bool -> Model -> Model
updateTodoCompleted todo completedOrNot model =
    { model
        | todos = model.todos |> updateCompleted todo.identifier completedOrNot
    }


removeTodo : Todo -> Model -> Model
removeTodo todo model =
    { model
        | todos = model.todos |> remove todo.identifier
    }


clearCompletedTodos : Model -> Model
clearCompletedTodos model =
    { model
        | todos = model.todos |> excludeCompleted
    }
