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

import Derektor.Stats as Stats
import Derektor.Jobs as Jobs
import Derektor.Templates as Templates
import Derektor.Queries as Queries
import Derektor.Reviews as Reviews
import Derektor.Schedules as Schedules

import Set exposing (Set)

type alias Data =
  { name : String
  , approval : String }

data : List Data
data =
  [ { name = "Gina Vasiloff"
    , approval = "No" }
  , { name = "Derek Bischke"
    , approval = "Yes" }
  , { name = "Ashton Gabrielsen"
    , approval = "Yes" }
  , { name = "Christina Smithers"
    , approval = "No" }
  , { name = "Lexi Huefner"
    , approval = "Yes" }
  ]

key : Data -> String
key =
  .name

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

model : Model
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

toggle : comparable -> Set comparable -> Set comparable
toggle x set =
  if Set.member x set then
    Set.remove x set
  else
    Set.insert x set

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Mdl msg' ->
      Material.update msg' model 

    SelectJobsTab num ->
      { model | jobsTab = num } ! []

    SelectTemplatesTab num ->
      { model | templatesTab = num } ! []  

    SelectQueriesTab num ->
      { model | queriesTab = num } ! [] 

    SelectStepperTab num ->
      { model | stepperTab = num } ! []

    SelectJobsTabRight num ->
      { model | jobsTabRight = num } ! []

    SelectTemplatesTabRight num ->
      { model | templatesTabRight = num } ! []

    SelectQueriesTabRight num ->
      { model | queriesTabRight = num } ! []

    Toggle idx ->
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

viewList : Model -> Html Msg
viewList model =
  List.ul
    []
    [ viewListItem model
    , viewListItem model
    , viewListItem model ]

viewListItem : Model -> Html Msg
viewListItem model =
  List.li
    []
    [ List.content 
      []
      [ text "Month Job number" ]
    , List.content 
      []
      [ text "Month Client" ]
    , List.content 
      []
      [ text "Month Last edited" ]
    , List.content 
      []
      [ text "Month Scheduled/Sent" ]
    , List.content 
      []
      [ text "Month Recipients" ]
    , List.content 
      []
      [ text "Month Template Used" ]
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
          0 -> viewList model
          1 -> viewList model
          2 -> viewList model
          3 -> viewList model
          _ -> viewList model
        ]
      ]
    ]

-- JOBS

viewJobs : Model -> Html Msg
viewJobs model =
  grid
    []
    [ jobsTimeFilterPane model
    , singleJobPane model ]

singleJobPane : Model -> Cell Msg
singleJobPane model =
  cell
    [ size All 6 ]
    [ Tabs.render Mdl [0] model.mdl
      [ Tabs.onSelectTab SelectJobsTabRight 
      , Tabs.activeTab model.jobsTabRight ]
      [ Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "Jobs"]
      , Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "New Jobs"]
      ]
      [ case model.jobsTabRight of
        0 -> text "jobs tab content"
        1 -> text "new jobs tab content"
        _ -> text "404"
      ]
    ]


-- TEMPLATES

viewTemplates : Model -> Html Msg
viewTemplates model =
  grid
    []
    [ templatesTimeFilterPane model
    , singleTemplatePane model ]

templatesTimeFilterPane : Model -> Cell Msg
templatesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ Tabs.render Mdl [0] model.mdl
        [ Tabs.onSelectTab SelectTemplatesTab
        , Tabs.activeTab model.templatesTab ]
        [ Tabs.label 
          [ Options.center
          , Options.css "cursor" "default" ] 
          [ text "All" ]
        , Tabs.label 
          [ Options.center 
          , Options.css "cursor" "default" ] 
          [ text "Most recent" ]
        ]
        [ case model.jobsTab of
          0 -> text "All Templates"
          1 -> text "Most recent templates"
          _ -> text "404"
        ]
      ]
    ]

singleTemplatePane : Model -> Cell Msg
singleTemplatePane model =
  cell
    [ size All 6 ]
    [ Tabs.render Mdl [0] model.mdl
      [ Tabs.onSelectTab SelectTemplatesTabRight 
      , Tabs.activeTab model.templatesTabRight ]
      [ Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "Templates"]
      , Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "New Templates"]
      ]
      [ case model.templatesTabRight of
        0 -> text "templates tab content"
        1 -> text "new templates tab content"
        _ -> text "404"
      ]
    ]
      

-- QUERIES

viewQueries : Model -> Html Msg
viewQueries model =
  grid
    []
    [ queriesTimeFilterPane model
    , singleQueryPane model ]

queriesTimeFilterPane : Model -> Cell Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ Tabs.render Mdl [0] model.mdl
        [ Tabs.onSelectTab SelectQueriesTab
        , Tabs.activeTab model.queriesTab ]
        [ Tabs.label 
          [ Options.center
          , Options.css "cursor" "default" ] 
          [ text "All" ]
        , Tabs.label 
          [ Options.center 
          , Options.css "cursor" "default" ] 
          [ text "Most recent" ]
        ]
        [ case model.jobsTab of
          0 -> text "View all queries"
          1 -> text "View recent queries"
          _ -> text "404"
        ]
      ]
    ]

singleQueryPane : Model -> Cell Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ Tabs.render Mdl [0] model.mdl
      [ Tabs.onSelectTab SelectQueriesTabRight 
      , Tabs.activeTab model.queriesTabRight ]
      [ Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "Queries"]
      , Tabs.label
        [ Options.center
        , Options.css "cursor" "default" ]
        [ text "New Queries"]
      ]
      [ case model.queriesTabRight of
        0 -> text "queries tab content"
        1 -> text "new queries tab content"
        _ -> text "404"
      ]
    ]

-- REVIEWS

viewReviews : Model -> Html Msg
viewReviews model =
  grid
    []
    [ reviewsPane model
    , singleReviewPane model ]

reviewsPane : Model -> Cell Msg
reviewsPane model =
  cell
    [ size All 6 ]
    [ h4 [] [text "Recipients"]
    , List.ul
      []
      [ List.li 
        []
        [text "sreed9@yellowbook.com"]
      , List.li 
        []
        [text "pfields4@freewebs.com"]
      , List.li 
        []
        [text "selliott8@cyberchimps.com"]    
      ]
    ]

singleReviewPane : Model -> Cell Msg
singleReviewPane model =
  cell
    [ size All 6 ]
    [ Table.table []
      [ Table.tbody []
        ( data
          |> List.indexedMap (\idx item ->
            Table.tr
              [ Table.selected `when` Set.member (key item) model.selected ]
                [ Table.td []
                  [ Toggles.checkbox Mdl [idx] model.mdl
                    [ Toggles.onClick (Toggle <| key item)
                    , Toggles.value <| Set.member (key item) model.selected
                    ] []
                  ]
                , Table.td [] [ text item.name ]
                , Table.td [ Table.numeric ] [ text item.approval ]
              ]
            )
          )
        ]
       , Options.img 
 -      [ Options.css "max-width" "100%" ]
 -      [ Html.Attributes.src "/assets/images/template.jpg"]
      ]

-- SCHEDULES 

viewSchedules : Model -> Html Msg
viewSchedules model =
  grid
    []
    [ schedulesPane model
    , singleschedulePane model ]

schedulesPane : Model -> Cell Msg
schedulesPane model =
  cell
    [ size All 6 ]
    [ text "Recurring Schedules"
    ]

singleschedulePane : Model -> Cell Msg
singleschedulePane model =
  cell
    [ size All 6 ]
    [ text "single schedule"]

viewStepper404 : Model -> Html Msg
viewStepper404 model =
  text "404"