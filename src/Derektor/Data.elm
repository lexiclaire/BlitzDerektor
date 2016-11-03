module Derektor.Data exposing (..)

import Material

import Set exposing (Set)

type alias Model =
  { mdl : Material.Model
  , jobsTab : Int
  , templatesTab : Int
  , queriesTab : Int
  , stepperTab : Int
  , jobsTabRight : Int
  , templatesTabRight : Int
  , queriesTabRight : Int
  , selected : Set String
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectTemplatesTab Int
  | SelectQueriesTab Int
  | SelectStepperTab Int
  | SelectJobsTabRight Int
  | SelectTemplatesTabRight Int
  | SelectQueriesTabRight Int
  | Toggle String