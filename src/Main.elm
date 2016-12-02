module Main exposing (..)

import Html exposing (..)
import Html.App as App

import Material
import Material.Layout as Layout
import Material.Scheme
import Material.Color as Color

import Derektor.Common as Common
import Derektor.Data as Data
import Derektor.Derektor as Derektor
import Derektor.Jobs as Jobs

import Mock_data exposing (..)

import String
import Time exposing (Time, second)
import Set exposing (Set)


-- MODEL

init : ( Data.Model, Cmd Data.Msg )
init =
  { mdl = Material.model
  , jobsTab = 0
  , stepperTab = 0
  , selected = Set.empty
  , primaryColor = Color.Grey
  , accentColor = Color.Orange
  , jobSummary = Jobs.getJobSummary
  , job = Just Mock_data.dummyJob
  , template = Nothing
  , currentTime = 0
  , initialSeed = 0
  , query = Mock_data.dummyQuery
  , schedules = Mock_data.dummySchedulesList
  } ! [ Data.getRandomNumber ]

-- UPDATE

update : Data.Msg -> Data.Model -> ( Data.Model, Cmd Data.Msg )
update msg model =
  case msg of
    Data.Mdl msg' ->
      Material.update msg' model 

    Data.SelectJobsTab num ->
      { model | jobsTab = num } ! []  

    Data.SelectStepperTab num ->
      { model | stepperTab = num } ! []

    Data.Toggle idx ->
      { model | selected = Common.toggle idx model.selected } ! []

    Data.RandomSeed ->
      model ! [ Data.getRandomNumber ]

    Data.RandomSeedSucceed seed ->
      { model | initialSeed = ( String.trim seed |> String.toInt |> Result.toMaybe |> Maybe.withDefault model.currentTime ) } ! []

    Data.RandomSeedFail _ ->
      { model | initialSeed = model.currentTime } ! []

    Data.Tick newTime ->
      {
        model |
          currentTime = round ( Time.inSeconds newTime ),
          initialSeed = if model.initialSeed == 0 then model.currentTime else model.initialSeed
      } ! []

    Data.SelectTemplate  template ->
      { model | template = Just template } ! []

    Data.SelectSchedules schedules ->
      case model.job of
        Nothing ->
          model ! []
        Just job -> 
          { model | job = Just { job | schedules = schedules } } ! []

    Data.UnselectSchedules ->
      case model.job of
        Nothing ->
          model ! []
        Just job -> 
          { model | job = Nothing } ! []

    Data.NextPage -> 
      let
        newStep = model.stepperTab + 1
      in  
        { model | stepperTab = newStep } ! []

    Data.AddScheduleRow ->
      if model.jobsTab == 0 then
        model ! []
      else
        model ! []

subscriptions : Data.Model -> Sub Data.Msg
subscriptions model =
  Time.every second Data.Tick

-- VIEW   

main : Program Never
main =
  App.program
    { init = init
    , view = view
    , subscriptions = subscriptions
    , update = update
    }

view : Data.Model -> Html Data.Msg
view model =
  Material.Scheme.topWithScheme model.primaryColor model.accentColor <|
  Layout.render Data.Mdl
    model.mdl
      [ Layout.fixedHeader
      , Layout.selectedTab model.jobsTab
      , Layout.onSelectTab Data.SelectJobsTab  
      ]
      { header = [ Derektor.viewHeader model ]
      , drawer = []
      , tabs = ( [ text "Past Jobs", text "New Job" ], [] )
      , main = [ Derektor.stepperNav model, Derektor.jobsTab model ]
      }
