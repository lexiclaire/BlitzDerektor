module Derektor.Data exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date
import Set exposing (Set)
import Time exposing (Time)
import Task
import Http

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
  , currentTime : Int
  , initialSeed : Int
  , jobSummary : Jobs
  , job : Maybe Job
  , template : Template
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectStepperTab Int
  | Toggle String
  | RandomSeed 
  | RandomSeedSucceed String
  | RandomSeedFail Http.Error
  | Tick Time

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

type alias JobSummary =
  { uuid : Maybe Uuid.Uuid
  , name : String
  , locked : Bool
  , lastEdited : Date.Date
  }

type alias Template = 
  { name : String
  , lastEdited : Date.Date
  , contents : String
  , variables : List ( Int, String, String )
  }

type alias TemplateSummary = String

type alias Query = 
  { name : String
  , lastEdited : Date.Date
  }

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

getRandomNumber : Cmd Msg
getRandomNumber =
  let
    url = "https://www.random.org/integers/?num=1&min=1&max=1000000000&col=1&base=10&format=plain&rnd=new"
  in
    Task.perform RandomSeedFail RandomSeedSucceed (Http.getString url)
