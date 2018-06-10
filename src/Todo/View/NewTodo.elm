module Todo.View.NewTodo exposing (view)

import Todo.Model exposing (Model)
import Todo.Msg exposing (Msg(UpdateTitle))
import TodoList.Msg exposing (Msg(AddTodo))
import Messages as Main exposing (Msg(MsgForTodo, MsgForTodoList, NoOp))
import Html exposing (Html, Attribute, input)
import Html.Attributes exposing (class, placeholder, autofocus, value)
import Events exposing (onEnter)
import Html.Events exposing (onInput)


view : Model -> Html Main.Msg
view todo =
    input
        [ class "new-todo"
        , placeholder "What needs to be done?"
        , autofocus True
        , onInput updateTodoTitle
        , onEnter (addTodo todo)
        , value todo.title
        ]
        []


updateTodoTitle : String -> Main.Msg
updateTodoTitle str =
    MsgForTodo (UpdateTitle str)


addTodo : Model -> Main.Msg
addTodo todo =
    if String.isEmpty todo.title then
        NoOp
    else
        MsgForTodoList (AddTodo todo.identifier todo.title)
