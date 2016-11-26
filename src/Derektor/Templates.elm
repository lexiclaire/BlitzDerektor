module Derektor.Templates exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table

import Derektor.Data as Data
import Mock_data

-- UPDATE


-- VIEW

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ templatesTimeFilterPane model
    , singleTemplatePane model ]

templatesTimeFilterPane : Data.Model -> Cell Data.Msg
templatesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Options.css "min-height" "70%" ]
      [ list model ]
    ]

singleTemplatePane : Data.Model -> Cell Data.Msg
singleTemplatePane model =
  cell
    [ size All 6 ]
    [ text "Template Preview" ]

list : Data.Model -> Html Data.Msg
list model =
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
        (List.map (\(template) -> Table.tr []
          [ Table.td [] [ text template.name ]
          , Table.td [] 
            [ Date.toFormattedString "yyyy-MM-dd HH:mm" template.lastEdited |> text
            ]
          ]
           ) Mock_data.mockedTemplatesList)
      ]
    ]