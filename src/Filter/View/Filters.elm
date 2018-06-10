module Filter.View.Filters exposing (..)

import Filter.Model exposing (DisplayMode(..))
import Messages as Main exposing (Msg)
import Filter.View.Filter
import Html exposing (Html, ul)
import Html.Attributes exposing (class)


view : DisplayMode -> Html Main.Msg
view currentDisplayMode =
    ul [ class "filters" ] <|
        List.map (Filter.View.Filter.view currentDisplayMode) [ All, Active, Completed ]
