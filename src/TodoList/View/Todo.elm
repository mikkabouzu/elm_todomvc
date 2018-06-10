module TodoList.View.Todo exposing (view)

import Messages as Main exposing (Msg(MsgForTodoList))
import Todo.Model as Todo exposing (Model)
import Todo.Msg as Todo exposing (Msg(Check))
import TodoList.Msg as TodoList exposing (..)
import Html exposing (Html, li, div, input, label, button, text)
import Html.Attributes exposing (classList, class, type_, checked)
import Html.Events exposing (onClick, onCheck)


view : Todo.Model -> ( String, Html Main.Msg )
view todo =
    ( toString todo.identifier
    , li [ classList [ ( "completed", todo.completed ) ] ]
        [ div [ class "view" ]
            [ input
                [ class "toggle"
                , type_ "checkbox"
                , checked todo.completed
                , onCheck (updateTodoCompleted todo)
                ]
                []
            , label [] [ text todo.title ]
            , button
                [ class "destroy"
                , onClick (removeTodo todo)
                ]
                []
            ]
        ]
    )


removeTodo : Todo.Model -> Main.Msg
removeTodo todo =
    MsgForTodoList <| DeleteTodo todo.identifier


updateTodoCompleted : Todo.Model -> Bool -> Main.Msg
updateTodoCompleted todo completedOrNot =
    MsgForTodoList <| MsgForTodo todo.identifier (Check completedOrNot)
