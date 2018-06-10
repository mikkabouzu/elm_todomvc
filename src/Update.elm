module Update exposing (update)

import Messages as Main exposing (Msg(..))
import Models exposing (Model, Todo)
import Todos.Helpers exposing (isValid, excludeCompleted, updateCompleted, remove)
import Filter.Update as Filter
import Todo.Update as Todo
import Todo.Model exposing (newTodo)
import TodoList.Msg exposing (Msg(AddTodo))


update : Main.Msg -> Model -> ( Model, Cmd Main.Msg )
update msg model =
    case msg of
        NoOp ->
            ( model
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

        MsgForTodo msgForTodo ->
            ( { model | todo = Todo.update (MsgForTodo msgForTodo) model.todo }
            , Cmd.none
            )

        -- hack for now
        MsgForTodoList (AddTodo todoIdentifier todoTitle) ->
            ( { model
                | todo = Todo.update (MsgForTodoList (AddTodo todoIdentifier todoTitle)) model.todo
                , todos = (newTodo todoIdentifier todoTitle) :: model.todos
              }
            , Cmd.none
            )


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
