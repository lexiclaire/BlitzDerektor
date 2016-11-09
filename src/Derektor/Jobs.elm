module Derektor.Jobs exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List

import Derektor.Data as Data

-- UPDATE

-- VIEW

pastJobsPane : Data.Model -> Cell Data.Msg
pastJobsPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ viewList model ]
    ]

viewList : Data.Model -> Html Data.Msg
viewList model =
  List.ul
    []
    [ viewListItem model ]

viewListItem : Data.Model -> Html Data.Msg
viewListItem model =
  List.li
    []
    [ List.content 
      []
      [ text "Month Job number" ]
    , List.content 
      []
      [ text "Month Client" ]
    , List.content 
      []
      [ text "Month Last edited" ]
    , List.content 
      []
      [ text "Month Scheduled/Sent" ]
    , List.content 
      []
      [ text "Month Recipients" ]
    , List.content 
      []
      [ text "Month Template Used" ]
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