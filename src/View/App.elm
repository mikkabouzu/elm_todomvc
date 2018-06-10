module View.App exposing (view)

import Model exposing (Model)
import Messages exposing (Msg)
import Html exposing (Html, div, header, h1, section, text, footer)
import Html.Attributes exposing (class)
import Filter.View.Filters as Filters
import Todo.View.NewTodo as NewTodo
import TodoList.View.TodoList as TodoList
import TodoList.View.ActiveCount as ActiveTodoCount
import TodoList.View.ClearCompleted as ClearCompletedTodos


view : Model -> Html Msg
view model =
    div [ class "todoapp" ]
        [ header [ class "header" ]
            [ h1 [] [ text "todos" ] ]
        , section [ class "main" ]
            [ NewTodo.view model.todo
            , TodoList.view model.filter.display model.todos
            ]
        , footer [ class "footer" ]
            [ ActiveTodoCount.view model.todos
            , Filters.view model.filter.display
            , ClearCompletedTodos.view
            ]
        ]
