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

import Set exposing (Set)


-- MODEL

init : Data.Model
init =
  { mdl = Material.model
  , jobsTab = 0
  , stepperTab = 0
  , selected = Set.empty
  , primaryColor = Color.Grey
  , accentColor = Color.Orange
  , jobSummary = Jobs.getJobSummary
  }


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


-- VIEW   

main : Program Never
main =
  App.program
    { init = ( init, Cmd.none )
    , view = view
    , subscriptions = always Sub.none
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