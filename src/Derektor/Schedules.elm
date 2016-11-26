module Derektor.Schedules exposing (..)

import Html exposing (..)

import Material.Grid exposing (..)

import Derektor.Data as Data


-- UPDATE


-- VIEW 

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ schedulesPane model
    , singleschedulePane model ]

schedulesPane : Data.Model -> Cell Data.Msg
schedulesPane model =
  cell
    [ size All 6 ]
    [ text "Recurring Schedules" ]

singleschedulePane : Data.Model -> Cell Data.Msg
singleschedulePane model =
  cell
    [ size All 6 ]
    [ text "single schedule"]