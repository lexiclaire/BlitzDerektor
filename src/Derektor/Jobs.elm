module Derektor.Jobs exposing (..)

import Html.App as App
import Html.Attributes exposing (style)
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List
import Material.Table as Table
import Material.Textfield as Textfield
import Material.Toggles as Toggles

import Derektor.Data as Data

-- UPDATE

-- VIEW
view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ pastJobsPane model
    , newJobsPane model ]

pastJobsPane : Data.Model -> Cell Data.Msg
pastJobsPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ viewList model ]
    ]

newJobsPane : Data.Model -> Cell Data.Msg
newJobsPane model =
  cell
    [ size All 6 ]
    [ h4 
      [ style [ ("text-align", "center") ] ]
      [ text "Create new job" ]
    , Options.div
      []
      [ Options.div
        []
        [ Textfield.render Data.Mdl
          [ 0 ]
          model.mdl
          [ Textfield.label "Enter Job Name" 
          ]
        ]
      ]
    ]

viewList : Data.Model -> Html Data.Msg
viewList model =
  List.ul
    []
    [ viewListItem model 
    , viewListItem model
    , viewListItem model ]

viewListItem : Data.Model -> Html Data.Msg
viewListItem model =
  List.li
    []
    [ List.content 
      []
      [ text "Job Name" ]
    , List.content 
      []
      [ text "Last edited date" ]
    ]

viewPastJobs : Data.Model -> Html Data.Msg
viewPastJobs model =
  grid
    []
    [ cell
      []
      [ text "Past Jobs" ]
    ]

viewNewJob : Data.Model -> Html Data.Msg
viewNewJob model =
  grid
    []
    [ cell 
      []
      [ text "New Job" ]
    ]