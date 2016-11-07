module Derektor.Data exposing (..)

import Material

import Set exposing (Set)

type alias Model =
  { mdl : Material.Model
  , jobsTab : Int
  , stepperTab : Int
  , selected : Set String
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectStepperTab Int
  | Toggle String