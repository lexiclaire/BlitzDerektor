module Derektor.Queries exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List
import Material.Tabs as Tabs

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
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ text "Query List" ]
    ]

singleQueryPane : Data.Model -> Cell Data.Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ text "Single Query" ]

