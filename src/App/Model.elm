module App.Model exposing (..)

import Browser.Navigation as Nav
import Url


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , duration : Int
    , timerOn : Bool
    }


initModel : Url.Url -> Nav.Key -> Model
initModel url key =
    { key = key
    , url = url
    , duration = 1
    , timerOn = False
    }
