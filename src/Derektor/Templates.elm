module Derektor.Templates exposing (..)

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
    [ templatesTimeFilterPane model
    , singleTemplatePane model ]

templatesTimeFilterPane : Data.Model -> Cell Data.Msg
templatesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ text "List of Templates" ]
    ]

singleTemplatePane : Data.Model -> Cell Data.Msg
singleTemplatePane model =
  cell
    [ size All 6 ]
    [ text "Template Preview" ]