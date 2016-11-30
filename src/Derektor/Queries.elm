module Derektor.Queries exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Html exposing (..)
import Html.Attributes

import Material.Grid exposing (..)
import Material.List as MdlList
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
    , singleQueryPane model.query.results
    , Common.nextButton model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ list model ]
    ]

singleQueryPane : List String -> Cell Data.Msg
singleQueryPane results =
  cell
    [ size All 6 ]
    [   Options.div
      [ Options.css "max-height" "400px" 
      , Options.css "overflow-y" "scroll" ]
      [ Table.table 
        [ Options.css "width" "100%" ]
        [ Table.thead []
          [ Table.th []
            [ text "Results" ]
          ]
        , Table.tbody []
          (List.map (\(result) -> (Table.tr []
            [Table.td [] [ text result ]])
          ) results) 
        ]
      ]
    ]

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
