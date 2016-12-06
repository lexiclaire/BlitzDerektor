module Derektor.Reviews exposing (..)

import Html exposing (..)

import Set exposing (Set)

import Material.Button as Button
import Material.Grid exposing (..)
import Material.Icon as Icon
import Material.Options as Options exposing (..)
import Material.Table as Table
import Material.Textfield as Textfield
import Material.Toggles as Toggles

import Derektor.Data as Data
import Derektor.Common as Common
import Mock_data 



-- UPDATE


-- VIEW

key : Data.Reviewer -> String
key = .name

view : Data.Model -> Html Data.Msg
view model =
  grid []
    [ reviewsPane model
    , approvalsPane model 
    , Common.nextButton model ]

reviewsPane : Data.Model -> Cell Data.Msg
reviewsPane model =
  let
    recipients =
    case model.job of
      Just job ->
        job.recipients
      Nothing ->
        []
  in
    cell [size All 6]
      [ Options.div
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
              [ text "Sent" ]
            , Table.th
              [ Options.css "height" "auto"
              , Options.css "padding" "4px"
              , Options.css "font-size" "11px" ]
              [ text "Recipient" ]
            ]
          , Table.tbody [ Options.css "font-size" "11px" ]
            ( recipients
              |> List.map (\item ->
                Table.tr [ Options.css "height" "auto" ] 
                  [ Table.td 
                    [ Options.css "padding" "4px" 
                    , Options.css "height" "auto" ]  
                    [] 
                  , Table.td 
                    [ Options.css "padding" "4px" 
                    , Options.css "height" "auto" ] 
                    [ text item.email ]  
                  ]
              )
            )  
          ]
        ]
      ]


approvalsPane : Data.Model -> Cell Data.Msg
approvalsPane model =
  cell
    [ size All 6 ]
    [ Table.table []
      [ Table.thead 
        [ Options.css "font-size" "11px"
        , Options.css "height" "auto" ]      
        [ Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ]
          []
        , Table.th 
          [ Options.css "height" "auto"
          , Options.css "padding" "4px"
          , Options.css "font-size" "11px" ]
          [ text "Reviewer email or name" ]
        ]
      , Table.tbody 
        [ Options.css "font-size" "11px" ]
          ( List.map (\idx ->
            Table.tr []
              [ Table.td 
                [ Options.css "padding" "4px" 
                , Options.css "height" "auto" ]
                [ Toggles.checkbox Data.Mdl [idx] model.mdl
                  [ Toggles.onClick <| Data.ReviewerApproved idx
                  , Toggles.value False
                  ] []
                ]
              , Table.td 
                [ Options.css "padding" "4px" 
                , Options.css "height" "auto" ] 
                [ Textfield.render Data.Mdl [0] model.mdl 
                  [ Textfield.label "Enter email or name"
                  ] 
                ]
              ]
            ) [0..model.reviewerLine]
          )
        ]
      , addAnotherReviewerButton model
      ] 


addAnotherReviewerButton : Data.Model -> Html Data.Msg
addAnotherReviewerButton model = 
  Button.render Data.Mdl [1] model.mdl
    [ Button.minifab
    , Button.raised
    , Button.ripple
    , Button.onClick Data.AddReviewerRow 
    ]
    [ Icon.i "add" ]