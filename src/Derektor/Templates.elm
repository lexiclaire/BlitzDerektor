module Derektor.Templates exposing (..)

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
    [ templatesTimeFilterPane model
    , singleTemplatePane model 
    , Common.nextButton model ]

templatesTimeFilterPane : Data.Model -> Cell Data.Msg
templatesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ list model ]

singleTemplatePane : Data.Model -> Cell Data.Msg
singleTemplatePane model =
  cell
    [ size All 6 ]
    [ grid []
      [ cell 
        [ size All 12 ]
        ( templateVariable model )
      , cell 
        [ size All 12 ]
        [ templateTextArea model ]
      ]
    ]

templateVariable : Data.Model -> List (Html Data.Msg)
templateVariable model = 
  let 
    variables =
      case model.template of
        Nothing ->
          []
        Just template ->
          template.variables
    ( _, tvars ) = 
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
    tvars

templateTextArea : Data.Model -> Html Data.Msg
templateTextArea model =
  let
    contents =
      case model.template of
        Nothing ->
          ""
        Just template ->
          template.contents
  in
    Textfield.render Data.Mdl [2] model.mdl
      [ Textfield.value contents
      , Textfield.textarea
      , Textfield.rows 15  
      ]    

list : Data.Model -> Html Data.Msg
list model =
  let
    (currentName, currentContents) =
      case model.template of
        Nothing ->
          ("", "")
        Just template ->
          (template.name, template.contents)
    in
      Options.div
        [ Options.css "max-height" "400px" 
        , Options.css "overflow-y" "scroll" ]
        [ Table.table 
          [ Options.css "width" "100%" ]
          [ Table.thead []
            [ Table.th 
              [ Options.css "height" "auto"
              , Options.css "padding" "4px"
              , Options.css "font-size" "11px" ] 
              [ text "Template Name" ] ]
          , Table.tbody 
            [ Options.css "font-size" "11px" ]
            ( List.map (\(template) -> 
              Table.tr 
              [ if template.name == currentName then Table.selected else Options.nop
              , Options.css "height" "auto" ]
              [ Table.td 
                [ Options.css "padding" "4px" 
                , Options.css "height" "auto" ]
                [ div 
                  [ Html.Events.onClick (Data.SelectTemplate template ) ] 
                  [ text template.name ] 
                ]
              ]
            ) Mock_data.mockedTemplatesList )
          ]
        ]