module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Nav exposing (Key)
import Html exposing (Html, a, button, div, section, text)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Json.Decode as Decode exposing (Value)
import Url exposing (Url)


type alias Model =
    Int


init flags url key =
    ( 3, Cmd.none )



-- UPDATE


type Msg
    = Increment
    | Decrement
    | OnUrlChange Url
    | OnUrlRequest UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        OnUrlChange _ ->
            ( model, Cmd.none )

        OnUrlRequest _ ->
            ( model, Cmd.none )


noop _ =
    0



-- VIEW


view : Model -> Document Msg
view model =
    { title = "ha"
    , body =
        [ div []
            [ button [ onClick Decrement, class "waves-effect waves-light btn" ] [ text "-" ]
            , div [] [ text (String.fromInt model) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Value Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = OnUrlChange
        , subscriptions = subscriptions
        , onUrlRequest = OnUrlRequest
        , update = update
        , view = view
        }
