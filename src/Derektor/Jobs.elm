module Derektor.Jobs exposing (..)

import Date.Extra as Date

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Derektor.Common as Common
import Mock_data 


-- UPDATE

getJobSummary : Data.Jobs 
getJobSummary =
  Mock_data.mockedJobs Mock_data.mockedJobList

-- VIEW
view : Data.Model -> Html Data.Msg
view model =
  grid []
    [ pastJobsPane model
    , newJobsPane model
    , Common.nextButton model ]

pastJobsPane : Data.Model -> Cell Data.Msg
pastJobsPane model =
  cell
    [ size All 6 ]
    [ viewList model ]

newJobsPane : Data.Model -> Cell Data.Msg
newJobsPane model =
  cell
    [ size All 6 ]
    [ Textfield.render Data.Mdl [ 0 ] model.mdl
      [ Textfield.label "Enter Job Name" 
      , Textfield.floatingLabel
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

viewPastJobs : Data.Model -> Html Data.Msg
viewPastJobs model =
  grid []
    [ cell []
      [ text "Past Jobs" ]
    ]

viewNewJob : Data.Model -> Html Data.Msg
viewNewJob model =
  grid []
    [ cell []
      [ text "New Job" ]
    ]
