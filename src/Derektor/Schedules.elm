module Derektor.Schedules exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List

import Derektor.Data as Data

-- SCHEDULES 

viewSchedules : Data.Model -> Html Data.Msg
viewSchedules model =
  grid
    []
    [ schedulesPane model
    , singleschedulePane model ]

schedulesPane : Data.Model -> Cell Data.Msg
schedulesPane model =
  cell
    [ size All 6 ]
    [ text "Recurring Schedules"
    ]

singleschedulePane : Data.Model -> Cell Data.Msg
singleschedulePane model =
  cell
    [ size All 6 ]
    [ text "single schedule"]