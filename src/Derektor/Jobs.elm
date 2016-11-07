module Derektor.Jobs exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List

import Derektor.Data as Data
import Derektor.Common as Common


-- UPDATE


-- VIEW


jobsTab : Data.Model -> Html Data.Msg
jobsTab model =
  case model.jobsTab of
      0 -> viewPastJobs model
      1 -> viewNewJob model
      _ -> Common.viewStepper404 model     

pastJobsPane : Data.Model -> Cell Data.Msg
pastJobsPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ viewList model ]
    ]

viewPastJobs : Data.Model -> Html Data.Msg
viewPastJobs model =
  grid
    []
    [ pastJobsPane model ]

viewNewJob : Data.Model -> Html Data.Msg
viewNewJob model =
  grid
    []
    [ cell 
      []
      [ Common.mainGrid model ]
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