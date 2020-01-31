module Components.Timer exposing (subscriptions, view)

import App.Model exposing (..)
import App.Update exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Time


subscriptions : Model -> Sub Msg
subscriptions model =
    if model.timerOn then
        Time.every 1000 Tick

    else
        Sub.none


handleClick : Model -> Msg
handleClick model =
    if model.timerOn then
        StopTimer

    else
        StartTimer


recordRow : ( String, Int ) -> Html msg
recordRow ( name, duration ) =
    li [ class "collection-item" ]
        [ div []
            [ b [] [ text name ]
            , span [] [ text "            " ]
            , span [] [ text <| String.fromInt <| duration ]
            ]
        ]


view : Model -> Html Msg
view model =
    let
        buttonText =
            if model.timerOn then
                "stop"

            else
                "start"
    in
    div [ id "timer", class "" ]
        [ div [ class "container" ]
            [ div [ class "row " ]
                [ div [ class "input-field col s12" ]
                    [ input [ id "name", value model.speakerName, onInput ChangeSpeakerName ] []
                    , label [ class "active", for "name" ] [ text "name" ]
                    ]
                , button
                    [ class "waves-effect waves-light btn"
                    , onClick <| handleClick <| model
                    ]
                    [ text buttonText ]
                , h2
                    []
                    [ text (String.fromInt model.duration) ]
                ]
            , ul [ class "collection" ]
                (List.map recordRow model.records)
            ]
        ]
