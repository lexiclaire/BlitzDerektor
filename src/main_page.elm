module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (href, class, style, src)
import Material
import Material.Scheme
import Material.Button as Button
import Material.Options as Options
import Material.Layout as Layout
import Material.Grid exposing (..)
import Material.Color as Color
import Material.Card as Card
import Material.Icon as Icon
import Material.Tabs as Tabs

import Derektor.Stats as Stats
import Derektor.Jobs as Jobs
import Derektor.Templates as Templates
import Derektor.Queries as Queries
import Derektor.Reviews as Reviews
import Derektor.Schedules as Schedules

type alias Model =
  { mdl : Material.Model
  , jobsTab : Int
  , stepperTab : Int
  }

model : Model
model =
  { mdl = Material.model
  , jobsTab = 0
  , stepperTab = 0
  }

type Msg
  = Mdl (Material.Msg Msg)
  | SelectJobsTab Int
  | SelectStepperTab Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Mdl msg' ->
      Material.update msg' model 

    SelectJobsTab num ->
      { model | jobsTab = num } ! []

    SelectStepperTab num ->
      { model | stepperTab = num } ! []

-- VIEW   
main : Program Never
main =
  App.program
    { init = ( model, Cmd.none )
    , view = view
    , subscriptions = always Sub.none
    , update = update
    }

view : Model -> Html Msg
view model =
  Layout.render Mdl
    model.mdl
      [ Layout.fixedHeader ]
      { header = [ viewHeader ]
      , drawer = []
      , tabs = ( [], [] )
      , main = [ viewBody model ]
      }

viewHeader : Html Msg
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

stepperTab : Model -> String
stepperTab model =
  case model.stepperTab of
      0 -> "Dash"
      1 -> "Jobs"
      2 -> "Templates"
      3 -> "Queries"
      4 -> "Reviews"
      5 -> "Schedules"
      _ -> "404"

viewStepper : Model -> Html Msg
viewStepper model = 
  Options.div
    []
    [ Tabs.render Mdl [0] model.mdl
      [ Tabs.onSelectTab SelectStepperTab
      , Tabs.activeTab model.stepperTab ]
      [ Tabs.label 
        [ Options.center ] 
        [ text "Dash" ]
      , Tabs.label 
        [ Options.center ] 
        [ text "Jobs" ]
      , Tabs.label 
        [ Options.center ] 
        [ text "Templates" ]
      , Tabs.label 
        [ Options.center ] 
        [ text "Queries" ]
      , Tabs.label 
        [ Options.center ] 
        [ text "Reviews" ]
      , Tabs.label 
        [ Options.center ] 
        [ text "Schedules" ]  
      ]
      []
    ]

viewBody : Model -> Html Msg
viewBody model =
  mainGrid model
    |> Material.Scheme.top

dummyGraphSet : Html Msg
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

jobsTab : String -> Html Msg
jobsTab tabName =
  grid
    []
    [ cell
      [ size All 12 ]
      [ text tabName ]
    ]

mainGrid : Model -> Html Msg
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
      [ size All 6 ]
      [ Options.div
        [ Options.css "border" "3px solid blue" ]
        [ h1
          [ style [ ("text-align", "center" ) ] ]
          [ text "Metrics" ]
        , dummyGraphSet
        , dummyGraphSet
        , dummyGraphSet
        ]
      ]
    , cell
      [ size All 6 ]
      [ Options.div
        [ Color.background ( Color.color Color.Teal Color.S50)
        , Options.css "min-height" "70%" ]
        [ Tabs.render Mdl [0] model.mdl
          [ Tabs.onSelectTab SelectJobsTab
          , Tabs.activeTab model.jobsTab ]
          [ Tabs.label 
            [ Options.center ] 
            [ text "All" ]
          , Tabs.label 
            [ Options.center ] 
            [ text "Month" ]
          , Tabs.label 
            [ Options.center ] 
            [ text "Week" ]
          , Tabs.label 
            [ Options.center ] 
            [ text "Day" ]
          ]
          [ case model.jobsTab of
            0 -> jobsTab "All jobs"
            1 -> jobsTab "Month's jobs"
            2 -> jobsTab "Week's jobs"
            3 -> jobsTab "Day's jobs"
            _ -> text "404"
          ]
        ]
      ]
    ]
  ]