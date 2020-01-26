module App.Model exposing (..)

import Browser.Navigation as Nav
import Url


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , duration : Int
    , timerOn : Bool
    , speakerName : String
    , records : List ( String, Int )
    }


initModel : Url.Url -> Nav.Key -> Model
initModel url key =
    { key = key
    , url = url
    , duration = 1
    , timerOn = False
    , speakerName = ""
    , records = []
    }
