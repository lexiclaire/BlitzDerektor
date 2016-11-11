module Derektor.Jobs exposing (..)

import Html.App as App
import Html.Attributes exposing (style)
import Html exposing (..)

import Material
import Material.Grid exposing (..)
import Material.Options as Options exposing (..)
import Material.Color as Color
import Material.List as List
import Material.Table as Table
import Material.Textfield as Textfield
import Material.Toggles as Toggles

import Date exposing (Month(..))
import Date.Extra as Date

import Derektor.Data as Data

import Mock_data 

import Set exposing (Set)

-- UPDATE

getJobSummary : Data.Jobs 
getJobSummary =
  Mock_data.mockedJobs Mock_data.mockedJobList

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
  Options.div
    [ Options.css "max-height" "400px" 
    , Options.css "overflow-y" "scroll" ]
    [ Table.table 
      [ Options.css "width" "100%" ]
      [ Table.thead []
        [ Table.th []
          [ text "Job Name" ]
        , Table.th []
          [ text "Last Edited Date" ]  
        ]
      , Table.tbody []
        ( model.jobSummary
          |> List.map (\item ->
            Table.tr [] 
              [ Table.td [] [ text item.name ] 
              , Table.td [] [ Date.toFormattedString "yyyy-MM-dd HH:mm" item.lastEdited |> text ]  
              ]
          )
        )  
      ]
    ]  

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