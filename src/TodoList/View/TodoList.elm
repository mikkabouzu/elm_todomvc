module TodoList.View.TodoList exposing (view)

import TodoList.View.Todo as Todo
import TodoList.Model as TodoList exposing (Model)
import Filter.Model exposing (DisplayMode(..))
import Messages exposing (Msg)
import Html.Keyed as Keyed
import Html exposing (Html, ul)
import Html.Attributes exposing (class)


view : DisplayMode -> TodoList.Model -> Html Msg
view currentDisplayMode todos =
    Keyed.ul [ class "todo-list" ] <|
        filtered currentDisplayMode
            >> List.map Todo.view
        <|
            todos


filtered : DisplayMode -> TodoList.Model -> TodoList.Model
filtered displayMode todos =
    let
        criteria =
            case displayMode of
                All ->
                    always True

                Active ->
                    not << .completed

                Completed ->
                    .completed
    in
        todos |> List.filter criteria
