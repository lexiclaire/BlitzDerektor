module Derektor.Jobs exposing (..)

import Date.Extra as Date

import Html exposing (..)

import Material.Button as Button
import Material.Grid exposing (..)
import Material.Icon as Icon
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
      [ Table.thead 
        [ Options.css "font-size" "11px"
        , Options.css "height" "auto" ]
        [ Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ]
          [ text "Job Name" ]
        , Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ]
          [ text "Last Edited Date" ] 
        , Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ] 
          []   
        ]
      , Table.tbody 
        [ Options.css "font-size" "11px" ]
        ( model.jobSummary
          |> List.map (\item ->
            Table.tr [ Options.css "height" "auto" ] 
              [ Table.td 
                [ Options.css "padding" "4px" 
                , Options.css "height" "auto" ] 
                [ text item.name ] 
              , Table.td 
                [ Options.css "padding" "4px"
                , Options.css "height" "auto" ] 
                [ Date.toFormattedString "yyyy-MM-dd HH:mm" item.lastEdited |> text ]
              , Table.td 
                [ Options.css "padding" "2px"
                , Options.css "height" "auto" ] 
                [ duplicateButton model ]   
              ]
          )
        )  
      ]
    ] 

duplicateButton : Data.Model -> Html Data.Msg
duplicateButton model =
  Button.render Data.Mdl [1] model.mdl
    [ Button.minifab
    , Button.ripple
    , Button.onClick Data.DuplicateMsg
    ]
    [ Icon.i "content_copy"]
