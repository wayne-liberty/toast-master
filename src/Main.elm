module Main exposing (init, main, subscriptions, view, viewLink)

import App.Model exposing (..)
import App.Update exposing (..)
import Browser
import Browser.Navigation as Nav
import Components.Header as Header
import Components.Timer as Timer
import Html exposing (..)
import Html.Attributes exposing (..)
import Platform.Sub exposing (Sub)
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( initModel url key, Cmd.none )



-- UPDATE
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Timer.subscriptions model ]



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "toast master"
    , body =
        [ Header.view
        , Timer.view model
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
