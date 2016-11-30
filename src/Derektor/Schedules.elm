module Derektor.Schedules exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Html exposing (..)

import Material.Button as Button
import Material.Grid exposing (..)
import Material.Icon as Icon
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Mock_data

-- UPDATE


-- VIEW 

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ schedulesTimeFilterPane model
    , singleschedulePane model 
    , sendButton model ]

schedulesTimeFilterPane : Data.Model -> Cell Data.Msg
schedulesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ list model ]
    ]


singleschedulePane : Data.Model -> Cell Data.Msg
singleschedulePane model =
  cell
    [ size All 6 ]
    [ createNewSchedule model ]

list : Data.Model -> Html Data.Msg
list model =
  Options.div
    [ Options.css "max-height" "400px" 
    , Options.css "overflow-y" "scroll" ]
    [ Table.table 
      [ Options.css "width" "100%" ]
      [ Table.thead []
        [ Table.th []
          [ text "Schedule Name" ] 
        ]
      , Table.tbody []
        [ Table.td [] [ text model.schedules.name ] ]
      ]
    ] 

createNewSchedule : Data.Model -> Html Data.Msg
createNewSchedule model =
  Options.div
    []
    [ Table.table []
      [ Table.thead []
        [ Table.th []
          [ text "Minute" ]
        , Table.th []
          [ text "Hour" ]
        , Table.th []
          [ text "Date" ]
        , Table.th []
          [ text "Month" ]
        , Table.th []
          [ text "Year" ]
        , Table.th []
          [ text "Day of week" ]
        , Table.th []
          [ text "Quantity" ]          
        ]
      , Table.tbody []
        [ Table.td []
          [ Textfield.render Data.Mdl [0] model.mdl 
            [ Textfield.maxlength 2
            , Options.css "width" "100%" ]
          ]
        , Table.td []
          [ Textfield.render Data.Mdl [1] model.mdl 
            [ Textfield.maxlength 2
            , Options.css "width" "100%" ]
          ] 
        , Table.td []
          [ Textfield.render Data.Mdl [2] model.mdl 
            [ Textfield.maxlength 2
            , Options.css "width" "100%" ]
          ]
        , Table.td []
          [ Textfield.render Data.Mdl [3] model.mdl 
            [ Textfield.maxlength 2
            , Options.css "width" "100%" ]
          ]
        , Table.td []
          [ Textfield.render Data.Mdl [4] model.mdl 
            [ Textfield.maxlength 4
            , Options.css "width" "100%" ]
          ] 
        , Table.td []
          [Textfield.render Data.Mdl [5] model.mdl 
            [ Textfield.maxlength 2
            , Options.css "width" "100%" ]
          ]
        , Table.td []
          [ Textfield.render Data.Mdl [6] model.mdl 
            [ Options.css "width" "100%" ]
          ]       
        ]  
      ]
      , addAnotherScheduleButton model
    ]

addAnotherScheduleButton : Data.Model -> Html Data.Msg
addAnotherScheduleButton model = 
  Button.render Data.Mdl [1] model.mdl
    [ Button.minifab
    , Button.raised
    , Button.ripple
    , Button.onClick Data.AddScheduleRow 
    ]
    [ Icon.i "add" ]

sendButton : Data.Model -> Cell Data.Msg
sendButton model = 
  cell
    [ offset All 12 ]
    [ Button.render Data.Mdl [0] model.mdl
      [ Button.raised
      , Button.ripple
      --, Button.onClick NextPage
      ]
      [ text "Send" ]
    ]   
