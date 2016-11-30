module Derektor.Templates exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Options as Options
import Material.Table as Table
import Material.Textfield as Textfield

import Derektor.Data as Data
import Derektor.Common as Common
import Mock_data 
import Mock_template

-- UPDATE


-- VIEW

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ templatesTimeFilterPane model
    , singleTemplatePane model 
    , Common.nextButton model ]

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
        ( templateVariable model )
      , cell
        [ size All 12 ]
        [ templateTextArea model ]
      ]
    ]

templateVariable : Data.Model -> List (Html Data.Msg)
templateVariable model = 
  let 
    ( _, tvars ) = 
      ( model.template.variables
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

  --( model.template.variables
  --  |> List.map (\ ( index, a, _ ) -> 
  --    Textfield.render Data.Mdl [ index ] model.mdl 
  --    [ Textfield.label a 
  --    , Textfield.floatingLabel
  --    ]
  --  )
  --)

templateTextArea : Data.Model -> Html Data.Msg
templateTextArea model =
  Textfield.render Data.Mdl [2] model.mdl
    [ Textfield.value model.template.contents
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
      [ Table.thead []
        [ Table.th []
          [ text "Template Name" ]
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