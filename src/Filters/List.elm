module Filters.List exposing (..)

import Models exposing (FilterState(..))
import Messages exposing (Msg)
import Html exposing (Html, ul)
import Html.Attributes exposing (class)
import Filters.Show


view : FilterState -> Html Msg
view selectedFilter =
    ul [ class "filters" ] <|
        List.map (Filters.Show.view selectedFilter) [ All, Active, Completed ]
