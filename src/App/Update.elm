module App.Update exposing (Msg(..), update)

import App.Model exposing (..)
import Browser
import Browser.Navigation as Nav
import Time
import Url


tableTopicLimit : Int
tableTopicLimit =
    150


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | StartTimer
    | StopTimer
    | Tick Time.Posix
    | ChangeSpeakerName String


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

        StartTimer ->
            ( { model
                | duration = 0
                , timerOn = True
              }
            , Cmd.none
            )

        StopTimer ->
            ( { model
                | timerOn = False
                , records = List.append model.records [ ( model.speakerName, model.duration ) ]
              }
            , Cmd.none
            )

        Tick _ ->
            ( { model | duration = model.duration + 1 }
            , Cmd.none
            )

        ChangeSpeakerName name ->
            ( { model | speakerName = name }
            , Cmd.none
            )
