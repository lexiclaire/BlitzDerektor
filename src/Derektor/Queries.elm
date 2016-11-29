module Derektor.Queries exposing (..)

import Date exposing (Month(..))
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
  grid
    []
    [ queriesTimeFilterPane model
    , singleQueryPane model 
    , Common.nextButton model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ list model ]
    ]

singleQueryPane : Data.Model -> Cell Data.Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ text "Single Query" ]

list : Data.Model -> Html Data.Msg
list model =
  Options.div
    [ Options.css "max-height" "400px" 
    , Options.css "overflow-y" "scroll" ]
    [ Table.table 
      [ Options.css "width" "100%" ]
      [ Table.thead []
        [ Table.th []
          [ text "Query Name" ]
        , Table.th []
          [ text "Last Edited Date" ]  
        ]
      , Table.tbody []
        (List.map (\(item) -> Table.tr []
          [ Table.td [] [ text item.name ]
          , Table.td [] 
            [ Date.toFormattedString "yyyy-MM-dd HH:mm" item.lastEdited |> text
            ]
          ]
        ) Mock_data.mockedQueriesList) 
      ]
    ]  
