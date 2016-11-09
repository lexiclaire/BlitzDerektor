module Main exposing (..)

import Html exposing (..)
import Html.App as App

import Material
import Material.Layout as Layout
import Material.Scheme

import Derektor.Data as Data
import Derektor.Common as Common
import Derektor.Jobs as Jobs

import Set exposing (Set)


-- MODEL

init : Data.Model
init =
  { mdl = Material.model
  , jobsTab = 0
  , stepperTab = 0
  , selected = Set.empty
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
  Material.Scheme.top <|
  Layout.render Data.Mdl
    model.mdl
      [ Layout.fixedHeader
      , Layout.onSelectTab Data.SelectJobsTab  
      ]
      { header = [ Common.viewHeader ]
      , drawer = []
      , tabs = ( [ text "Past Jobs", text "New Job" ], [] )
      , main = [ Common.jobsTab model ]
      }