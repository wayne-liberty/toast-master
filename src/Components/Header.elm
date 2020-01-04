module Components.Header exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href, value)



view =
    nav [ class "nav-wrapper" ]
        [ ul [ class "left" ]
            [ li []
                [ a [ href "/table-topic" ] [ text "table topic" ] ]
            ]
        ]
