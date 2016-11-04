module Derektor.Data exposing (..)

import Material

import Set exposing (Set)

type alias Model =
  { mdl : Material.Model
  , stepperTab : Int
  , selected : Set String
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectStepperTab Int
  | Toggle String