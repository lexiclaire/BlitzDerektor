module Derektor.Queries exposing (..)

import Date.Extra as Date

import Html exposing (..)
import Html.Events

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Derektor.Common as Common
import Mock_data 

-- UPDATE


-- VIEW

view : Data.Model -> Html Data.Msg
view model =
  grid []
    [ queriesTimeFilterPane model
    , singleQueryPane model
    , Common.nextButton model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ list model ]

singleQueryPane : Data.Model -> Cell Data.Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ grid []
      [ cell 
        [ size All 12 ]
        ( queryVariable model )
      , cell 
        [ size All 12 ]
        [ queryTextArea model ]
      ]
    ]

queryVariable : Data.Model -> List (Html Data.Msg)
queryVariable model = 
  let 
    variables =
      case model.query of
        Nothing ->
          []
        Just query ->
          query.variables
    ( _, qvars ) = 
      ( variables
        |> List.foldl (\ ( index, a, _ ) ( idx, acc ) -> 
          ( idx + 1
          , List.concat 
            [ acc
            , [ Textfield.render Data.Mdl [ idx ] model.mdl 
                [ Textfield.label a 
                , Textfield.floatingLabel
                ]
              ]
            ]
          )
        ) ( 0, [] )
      )
  in
    qvars

queryTextArea : Data.Model -> Html Data.Msg
queryTextArea model =
  let
    contents =
      case model.query of
        Nothing ->
          ""
        Just query ->
          query.sql
  in
    Textfield.render Data.Mdl [2] model.mdl
      [ Textfield.value contents
      , Textfield.textarea
      , Textfield.rows 15  
      ]

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
            [ div
              [ Html.Events.onClick <| Data.SelectQuery item ]
              [ text item.name ] 
            ]
          , Table.td 
            [ Options.css "height" "auto"
            , Options.css "padding" "4px" ] 
            [ div
              [ Html.Events.onClick <| Data.SelectQuery item ]
              [ Date.toFormattedString "yyyy-MM-dd HH:mm" item.lastEdited 
                |> text
              ]
            ]  
          ]
        ) Mock_data.mockedQueriesList) 
      ]
    ]  
