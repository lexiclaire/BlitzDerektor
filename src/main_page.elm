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

stepperTab : Model -> Html Msg
stepperTab model =
  case model.stepperTab of
      0 -> viewDash model
      1 -> viewJobs model
      2 -> viewTemplates model
      3 -> viewQueries model
      4 -> viewReviews model
      5 -> viewSchedules model
      _ -> viewStepper404 model

viewStepper : Model -> Html Msg
viewStepper model = 
  Options.div
    []
    [ Tabs.render Mdl [0] model.mdl
      [ Tabs.onSelectTab SelectStepperTab
      , Tabs.activeTab model.stepperTab ]
      [ Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Dash" ]
      , Tabs.label 
        [ Options.center
        , Options.css "cursor" "default" ] 
        [ text "Jobs" ]
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
      [ size All 12 ]
      [ model |> (List.drop model.stepperTab viewTypes |> List.head |> Maybe.withDefault viewStepper404) ]
    ]
  ]

-- PANES

viewTypes : List ( Model -> Html Msg )
viewTypes =
  [ viewDash
  , viewJobs
  , viewTemplates
  , viewQueries
  , viewReviews
  , viewSchedules
  , viewStepper404
  ]

-- DASH

viewDash : Model -> Html Msg
viewDash model =
  grid
    []
    [ metricsPane model
    , jobsTimeFilterPane model ]

metricsPane : Model -> Cell Msg
metricsPane model =
  cell
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

jobsTimeFilterPane : Model -> Cell Msg
jobsTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ Tabs.render Mdl [0] model.mdl
        [ Tabs.onSelectTab SelectJobsTab
        , Tabs.activeTab model.jobsTab ]
        [ Tabs.label 
          [ Options.center
          , Options.css "cursor" "default" ] 
          [ text "All" ]
        , Tabs.label 
          [ Options.center 
          , Options.css "cursor" "default" ] 
          [ text "Month" ]
        , Tabs.label 
          [ Options.center 
          , Options.css "cursor" "default" ] 
          [ text "Week" ]
        , Tabs.label 
          [ Options.center 
          , Options.css "cursor" "default" ] 
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

-- JOBS

viewJobs : Model -> Html Msg
viewJobs model =
  grid
    []
    [ jobsTimeFilterPane model
    , viewSingleJob model ]

viewSingleJob : Model -> Cell Msg
viewSingleJob model =
  cell
    [ size All 6 ]
    [ text "single job"]

viewTemplates : Model -> Html Msg
viewTemplates model =
  text "Templates"

viewQueries : Model -> Html Msg
viewQueries model =
  text "Queries"

viewReviews : Model -> Html Msg
viewReviews model =
  text "Reviews"

viewSchedules : Model -> Html Msg
viewSchedules model =
  text "Schedules"

viewStepper404 : Model -> Html Msg
viewStepper404 model =
  text "404"