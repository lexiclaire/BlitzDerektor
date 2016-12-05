module Derektor.Schedules exposing (..)

import Html exposing (..)
import Html.Events

import Material.Button as Button
import Material.Grid exposing (..)
import Material.Icon as Icon
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Mock_data


-- MODEL


-- UPDATE


-- VIEW 

view : Data.Model -> Html Data.Msg
view model =
  grid []
    [ schedulesTimeFilterPane model
    , singleschedulePane model 
    , sendButton model ]

schedulesTimeFilterPane : Data.Model -> Cell Data.Msg
schedulesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ list model ]

singleschedulePane : Data.Model -> Cell Data.Msg
singleschedulePane model =
  cell
    [ size All 6
    , Options.attribute <| Html.Events.onClick Data.UnselectSchedules ]
    [ createNewSchedule model ]

list : Data.Model -> Html Data.Msg
list model =
  let
    currentSchedulesName = 
      case model.job of
        Nothing ->
          ""
        Just job ->
          job.schedules.name
  in
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
          ( List.map (\(schedules) -> 
            Table.tr 
              [ if schedules.name == currentSchedulesName then Table.selected else Options.nop ] 
              [ Table.td [] 
                [ div 
                  [ Html.Events.onClick (Data.SelectSchedules schedules ) ] 
                  [ text schedules.name ] 
                ]
              ]
            ) model.schedules )
        ]
      ] 

createNewSchedule : Data.Model -> Html Data.Msg
createNewSchedule model =
  Options.div []
    [ Table.table []
      [ Table.thead []
        [ Table.th [] [ text "Minute" ]
        , Table.th [] [ text "Hour" ]
        , Table.th [] [ text "Date" ]
        , Table.th [] [ text "Month" ]
        , Table.th [] [ text "Year" ]
        , Table.th [] [ text "Day of week" ]
        , Table.th [] [ text "Quantity" ]          
        ]
      , Table.tbody []
        ( List.map (\(n) -> customScheduleRow model n ) [0..model.customScheduleLine] )
      ]
      , addAnotherScheduleButton model
    ]

customScheduleRow : Data.Model -> Int -> Html Data.Msg
customScheduleRow model rowNumber =
  Table.tr []
    ( List.concat [ (List.map (\(n) -> dateField n model.mdl ) [0..5] )
          , [ Table.td []
              [ Textfield.render Data.Mdl [6] model.mdl 
                [ Options.css "width" "100%" ]
              ] 
            ] 
        ] ) 


dateField index mdl = 
  Table.td []
    [ Textfield.render Data.Mdl [index] mdl 
      [ Textfield.maxlength 2
      , Options.css "width" "100%" ] 
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
      --, Button.onClick Data.SendJob
      ]
      [ text "Send" ]
    ]   
