module Derektor.Data exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date
import Set exposing (Set)

import Uuid exposing (..)

import Material
import Material.Color as Color

type alias Model =
  { mdl : Material.Model
  , jobsTab : Int
  , stepperTab : Int
  , selected : Set String
  , primaryColor : Color.Hue
  , accentColor : Color.Hue
  , jobSummary : Jobs
  , job : Job
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectStepperTab Int
  | Toggle String

type alias Job =
  { uuid : Maybe Uuid.Uuid
  , name : String
  , locked : Bool
  , lastEdited : Date.Date
  , template : Template
  , query : Query
  , review : Review
  , schedule : Schedule
  , recipients : List Recipient
  }

newJob : Job
newJob =
  { uuid = Nothing
  , name = ""
  , locked = False
  , lastEdited = Date.fromTime 0
  , template = ""
  , query = ""
  , review = ""
  , schedule = ""
  , recipients = []
  }

type alias JobSummary =
  { uuid : Maybe Uuid.Uuid
  , name : String
  , locked : Bool
  , lastEdited : Date.Date
  }

type alias Template = String

type alias TemplateSummary = String

type alias Query = String

type alias QuerySummary = String

type alias Review = String

type alias Schedule = String

type alias Recipient = 
  { sentFlag : Bool
  , receivedFlag : Bool
  , openedFlag : Bool
  , clickedFlag : Bool
  , email : String
  }

type alias Jobs = List JobSummary

type alias Templates = List TemplateSummary

type alias Queries = List QuerySummary

type alias Schedules = List Schedule
