module App.Update exposing (Msg(..), update)

import App.Model exposing (..)
import Browser
import Browser.Navigation as Nav
import Time
import Url


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | ToggleTimer
    | Tick Time.Posix


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

        ToggleTimer ->
            ( { model | timerOn = not model.timerOn }
            , Cmd.none
            )

        Tick _ ->
            ( { model | duration = model.duration + 1 }
            , Cmd.none
            )
