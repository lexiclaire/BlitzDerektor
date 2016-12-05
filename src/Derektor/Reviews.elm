module Derektor.Reviews exposing (..)

import Html exposing (..)

import Set exposing (Set)

import Material.Grid exposing (..)
import Material.Options as Options exposing (..)
import Material.Table as Table
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
          [ Table.thead []
            [ Table.th [] [ text "S" ]
            , Table.th [] [ text "R" ]
            , Table.th [] [ text "O" ]
            , Table.th [] [ text "C" ]
            , Table.th []
              [ text "Recipient" ]
            ]
          , Table.tbody []
            ( recipients
              |> List.map (\item ->
                Table.tr [] 
                  [ Table.td [] [] 
                  , Table.td [] [] 
                  , Table.td [] [] 
                  , Table.td [] [] 
                  , Table.td [] [ text item.email ]  
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
      [ Table.thead []
        [ Table.th []
          []
        , Table.th []
          [ text "Name" ]
        , Table.th []
          [ text "Required?" ]
        ]
      , Table.tbody []
        ( Mock_data.dummyReviewer
          |> List.indexedMap (\idx item ->
            Table.tr
              [ Table.selected `when` Set.member (key item) model.selected ]
                [ Table.td []
                  [ Toggles.checkbox Data.Mdl [idx] model.mdl
                    [ Toggles.onClick (Data.Toggle <| key item)
                    , Toggles.value <| Set.member (key item) model.selected
                    ] []
                  ]
                , Table.td [] [ text item.name ]
                , Table.td [ Table.numeric ] [ text item.approval ]
              ]
            )
          )
        ]
      ]