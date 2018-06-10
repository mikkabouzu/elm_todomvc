module Filter.View.Filter exposing (..)

import Filter.Model exposing (DisplayMode)
import Messages as Main exposing (Msg(MsgForFilter))
import Filter.Msg as Filter exposing (Msg(ChangeDisplay))
import Html exposing (Html, li, a, text)
import Html.Attributes exposing (classList, href)
import Html.Events exposing (onClick)


view : DisplayMode -> DisplayMode -> Html Main.Msg
view currentDisplayMode displayMode =
    li []
        [ a
            [ classList [ ( "selected", displayMode == currentDisplayMode ) ]
            , href "#"
            , onClick (MsgForFilter <| ChangeDisplay displayMode)
            ]
            [ text (toString displayMode) ]
        ]
