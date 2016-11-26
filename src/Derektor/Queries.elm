module Derektor.Queries exposing (..)

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Options as Options

import Derektor.Data as Data


-- UPDATE


-- VIEW

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ queriesTimeFilterPane model
    , singleQueryPane model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ text "Query List" ]
    ]

singleQueryPane : Data.Model -> Cell Data.Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ text "Single Query" ]

