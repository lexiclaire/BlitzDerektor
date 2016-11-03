module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (href, class, style, src)
import Material
import Material.Scheme
import Material.Button as Button
import Material.Options as Options
import Material.Options as Options exposing (when)
import Material.Layout as Layout
import Material.Grid exposing (..)
import Material.Color as Color
import Material.Card as Card
import Material.Icon as Icon
import Material.Tabs as Tabs
import Material.Textfield as Textfield
import Material.List as List
import Material.Table as Table
import Material.Toggles as Toggles

import Derektor.Data as Data
import Derektor.Jobs as Jobs
import Derektor.Templates as Templates
import Derektor.Queries as Queries
import Derektor.Reviews as Reviews
import Derektor.Schedules as Schedules

import Set exposing (Set)

model : Data.Model
model =
  { mdl = Material.model
  , jobsTab = 0
  , templatesTab = 0
  , queriesTab = 0
  , stepperTab = 0
  , jobsTabRight = 0
  , templatesTabRight = 0
  , queriesTabRight = 0
  , selected = Set.empty
  }

toggle : comparable -> Set comparable -> Set comparable
toggle x set =
  if Set.member x set then
    Set.remove x set
  else
    Set.insert x set

update : Data.Msg -> Data.Model -> ( Data.Model, Cmd Data.Msg )
update msg model =
  case msg of
    Data.Mdl msg' ->
      Material.update msg' model 

    Data.SelectJobsTab num ->
      { model | jobsTab = num } ! []

    Data.SelectTemplatesTab num ->
      { model | templatesTab = num } ! []  

    Data.SelectQueriesTab num ->
      { model | queriesTab = num } ! [] 

    Data.SelectStepperTab num ->
      { model | stepperTab = num } ! []

    Data.SelectJobsTabRight num ->
      { model | jobsTabRight = num } ! []

    Data.SelectTemplatesTabRight num ->
      { model | templatesTabRight = num } ! []

    Data.SelectQueriesTabRight num ->
      { model | queriesTabRight = num } ! []

    Data.Toggle idx ->
      { model | selected = toggle idx model.selected } ! []

-- VIEW   
main : Program Never
main =
  App.program
    { init = ( model, Cmd.none )
    , view = view
    , subscriptions = always Sub.none
    , update = update
    }

view : Data.Model -> Html Data.Msg
view model =
  Layout.render Data.Mdl
    model.mdl
      [ Layout.fixedHeader ]
      { header = [ viewHeader ]
      , drawer = []
      , tabs = ( [], [] )
      , main = [ viewBody model ]
      }

viewHeader : Html Data.Msg
viewHeader =
  Options.div
    [ Color.background (Color.color Color.Teal Color.S400) ]
    [ h1
      [ style
        [ ( "padding", "2rem" ) ]
      ]
      [ text "BlitzDerektor" ]
    ]

iconEmail : Html msg 
iconEmail = Icon.i "email"

iconEdit : Html msg 
iconEdit = Icon.i "create" 

stepperTab : Data.Model -> Html Data.Msg
stepperTab model =
  case model.stepperTab of
      0 -> Jobs.viewPastJobs model
      1 -> Jobs.viewNewJob model
      2 -> Templates.viewTemplates model
      3 -> Queries.viewQueries model
      4 -> Reviews.viewReviews model
      5 -> Schedules.viewSchedules model
      _ -> viewStepper404 model

viewStepper : Data.Model -> Html Data.Msg
viewStepper model = 
  Options.div
    []
    [ Tabs.render Data.Mdl [0] model.mdl
      [ Tabs.onSelectTab Data.SelectStepperTab
      , Tabs.activeTab model.stepperTab ]
      [ Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Past Jobs" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "New Job" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Templates" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Queries" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Reviews" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Schedules" ]  
      ]
      []
    ]

viewStepper404 : Data.Model -> Html Data.Msg
viewStepper404 model =
  text "404"

viewBody : Data.Model -> Html Data.Msg
viewBody model =
  mainGrid model
    |> Material.Scheme.top

dummyGraphSet : Html Data.Msg
dummyGraphSet =
  Options.div
    []
    [ Options.img
      [ Options.css "width" "50%" ]
      [ Html.Attributes.src "/assets/images/dial.jpg" ]
    , Options.img
      [ Options.css "width" "50%" ]
      [ Html.Attributes.src "/assets/images/bar.png" ]
    ]

jobsTab : String -> Html Data.Msg
jobsTab tabName =
  grid
    []
    [ cell
      [ size All 12 ]
      [ text tabName ]
    ]

mainGrid : Data.Model -> Html Data.Msg
mainGrid model =
  Options.div
  []
  [ grid 
    [ Options.css "width" "100%"
    , Options.css "position" "fixed"
    , Options.css "background-color" "#FFF"
    , Options.css "z-index" "1"
    , Options.css "padding" "0px 8px" ]
    [ cell
      [ size All 12
      , Options.css "margin" "0px 8px" ]
      [ viewStepper model ]
    ]
  , grid
    [ Options.css "width" "100%"
    , Options.css "padding" "48px 0px 0px"]
    [ cell
      [ size All 12 ]
      [ model |> (List.drop model.stepperTab viewTypes |> List.head |> Maybe.withDefault viewStepper404) ]
    ]
  ]

-- PANES

viewTypes : List ( Data.Model -> Html Data.Msg )
viewTypes =
  [ Jobs.viewPastJobs
  , Jobs.viewNewJob
  , Templates.viewTemplates
  , Queries.viewQueries
  , Reviews.viewReviews
  , Schedules.viewSchedules
  , viewStepper404
  ]
