module Derektor.Common exposing (..)

import Set exposing (Set)

import Html exposing (..)

import Material.Grid exposing (..)
import Material.Button as Button

import Derektor.Data as Data

-- UPDATE

toggle : comparable -> Set comparable -> Set comparable
toggle x set =
  if Set.member x set then
    Set.remove x set
  else
    Set.insert x set

nextButton : Data.Model -> Cell Data.Msg
nextButton model = 
  cell
    [ offset All 12 ]
    [ Button.render Data.Mdl [0] model.mdl
      [ Button.raised
      , Button.ripple
      , Button.onClick Data.NextPage
      ]
      [ text "Next" ]
    ]

isNewJob : Int -> Bool
isNewJob tabNum =
  case tabNum of 
    0 -> False
    1 -> True
    _ -> False

