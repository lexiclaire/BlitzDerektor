module Derektor.Reviews exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options exposing (..)
import Material.Color as Color
import Material.List as List
import Material.Table as Table
import Material.Toggles as Toggles

import Derektor.Data as Data

import Set exposing (Set)


-- UPDATE

type alias Data =
  { name : String
  , approval : String }

data : List Data
data =
  [ { name = "Gina Vasiloff"
    , approval = "No" }
  , { name = "Derek Bischke"
    , approval = "Yes" }
  , { name = "Ashton Gabrielsen"
    , approval = "Yes" }
  , { name = "Christina Smithers"
    , approval = "No" }
  , { name = "Lexi Huefner"
    , approval = "Yes" }
  ]


-- VIEW

key : Data -> String
key =
  .name

view : Data.Model -> Html Data.Msg
view model =
  grid
    []
    [ reviewsPane model
    , singleReviewPane model ]

reviewsPane : Data.Model -> Cell Data.Msg
reviewsPane model =
  cell
    [ size All 6 ]
    [ h4 [] [text "Recipients"]
    , List.ul
      []
      [ List.li 
        []
        [text "sreed9@yellowbook.com"]
      , List.li 
        []
        [text "pfields4@freewebs.com"]
      , List.li 
        []
        [text "selliott8@cyberchimps.com"]    
      ]
    ]

singleReviewPane : Data.Model -> Cell Data.Msg
singleReviewPane model =
  cell
    [ size All 6 ]
    [ Table.table []
      [ Table.tbody []
        ( data
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