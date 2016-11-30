module Derektor.Templates exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Html exposing (..)
import Html.Events

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Mock_data 
import Mock_template

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
    [ grid 
      []
      [ cell 
        [ size All 12 ]
        [ templateVariable model ]
      , cell
        [ size All 12 ]
        [ templateTextArea model ]
      ]
    ]

templateVariable : Data.Model -> Html Data.Msg
templateVariable model = 
  Textfield.render Data.Mdl [1] model.mdl 
    [ Textfield.label "variable" 
    , Textfield.floatingLabel 
    ]

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
            [ Table.th [] [ text "Job Name" ] ]
          , Table.tbody []
            ( List.map (\(template) -> 
              Table.tr 
              [if template.name == currentName then Table.selected else Options.nop]
              [ Table.td []
                [ div [ Html.Events.onClick (Data.SelectTemplate template )] [ text template.name ] ]
              ]
            ) Mock_data.mockedTemplatesList)
          ]
        ]