module Derektor.Data exposing (..)

import Date exposing (Month(..))
import Http
import Set exposing (Set)
import Time exposing (Time)
import Task
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
  , template : Maybe Template
  , query : Maybe Query
  , schedules : List Schedules
  , customScheduleLine : Int
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectStepperTab Int
  | DuplicateMsg
  | Toggle String
  | RandomSeed 
  | RandomSeedSucceed String
  | RandomSeedFail Http.Error
  | Tick Time
  | SelectTemplate Template
  | SelectQuery Query
  | SelectSchedules Schedules
  | UnselectSchedules
  | NextPage  
  | AddScheduleRow


type alias Job =
  { uuid : Maybe Uuid.Uuid
  , name : String
  , locked : Bool
  , lastEdited : Date.Date
  , template : Template
  , query : Query
  , review : Review
  , schedules : Schedules
  , recipients : List Recipient
  }

type alias JobSummary =
  { uuid : Maybe Uuid.Uuid
  , name : String
  , locked : Bool
  , lastEdited : Date.Date
  }

type alias Jobs = List JobSummary

type alias Template = 
  { name : String
  , contents : String
  , variables : List ( Int, String, String )
  }

type alias TemplateSummary = String

type alias Templates = List TemplateSummary

type alias Query = 
  { name : String
  , sql : String
  , lastEdited : Date.Date
  , variables : List ( Int, String, String )
  }

type alias QuerySummary = String

type alias Queries = List QuerySummary

type alias Recipient = 
  { sentFlag : Bool
  , receivedFlag : Bool
  , openedFlag : Bool
  , clickedFlag : Bool
  , email : String
  }

type alias Review = String

type alias Reviewer =
  { name : String
  , approval : String }

type alias Schedule = 
  { minute : Int
  , hour : Int
  , date : Int
  , month : Int
  , year : Int
  , dayOfWeek : Int
  , quantity : Int
  }

type alias Schedules = 
  { name : String
  , batches : List Schedule }

getRandomNumber : Cmd Msg
getRandomNumber =
  let
    url = "https://www.random.org/integers/?num=1&min=1&max=1000000000&col=1&base=10&format=plain&rnd=new"
  in
    Task.perform RandomSeedFail RandomSeedSucceed (Http.getString url)
