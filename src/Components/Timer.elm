module Components.Timer exposing (subscriptions, view)

import App.Model exposing (..)
import App.Update exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Time



-- type alias Model =
--     Int
-- UPDATE
-- update : Msg -> Model -> Model
-- update msg model =
--     case msg of
--         Increment ->
--             model + 1
--         Decrement ->
--             model - 1


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.timerOn of
        True ->
            Time.every 1000 Tick

        False ->
            Sub.none


view : Model -> Html Msg
view model =
    div [ id "timer", class "" ]
        [ div [ class "container" ]
            [ div [ class "row " ]
                [ div [ class "input-field col s12" ]
                    [ input [ id "name", class "validate" ] []
                    , label [ class "active", for "name" ] [ text "name" ]
                    ]
                , button
                    [ class "waves-effect waves-light btn"
                    , onClick <| ToggleTimer
                    ]
                    [ text "toggle timer" ]
                , h2
                    []
                    [ text (String.fromInt model.duration) ]
                ]
            ]
        ]
