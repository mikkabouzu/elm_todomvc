module Filters.Show exposing (..)

import Models exposing (FilterState)
import Messages exposing (Msg(FilterTodos))
import Html exposing (Html, li, a, text)
import Html.Attributes exposing (classList, href)
import Html.Events exposing (onClick)


view : FilterState -> FilterState -> Html Msg
view selectedFilter filter =
    li []
        [ a
            [ classList [ ( "selected", (selectedFilter == filter) ) ]
            , href "#"
            , onClick (FilterTodos filter)
            ]
            [ text (toString filter) ]
        ]
