module Derektor.Queries exposing (..)

import Date.Extra as Date

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table

import Derektor.Data as Data
import Derektor.Common as Common
import Mock_data 

-- UPDATE


-- VIEW

view : Data.Model -> Html Data.Msg
view model =
  grid []
    [ queriesTimeFilterPane model
    , Common.nextButton model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ list model ]

list : Data.Model -> Html Data.Msg
list model =
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
          [ text "Query Name" ]
        , Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ]
          [ text "Last Edited Date" ]  
        ]
      , Table.tbody [ Options.css "font-size" "11px" ]
        (List.map (\(item) -> 
          Table.tr [ Options.css "height" "auto" ]
          [ Table.td 
            [ Options.css "height" "auto"
            , Options.css "padding" "4px" ]  
            [ text item.name ]
          , Table.td 
            [ Options.css "height" "auto"
            , Options.css "padding" "4px" ] 
            [ Date.toFormattedString "yyyy-MM-dd HH:mm" item.lastEdited 
              |> text
            ]
          ]
        ) Mock_data.mockedQueriesList) 
      ]
    ]  
