module Derektor.Common exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style, src)

import Material.Color as Color
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Scheme
import Material.Tabs as Tabs

import Derektor.Data as Data
import Derektor.Jobs as Jobs
import Derektor.Templates as Templates
import Derektor.Queries as Queries
import Derektor.Reviews as Reviews
import Derektor.Schedules as Schedules

import Set exposing (Set)


-- UPDATE

toggle : comparable -> Set comparable -> Set comparable
toggle x set =
  if Set.member x set then
    Set.remove x set
  else
    Set.insert x set


-- VIEW

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

stepperTab : Data.Model -> Html Data.Msg
stepperTab model =
  case model.stepperTab of
      0 -> Jobs.viewPastJobs model
      1 -> Jobs.viewNewJob model
      2 -> Templates.view model
      3 -> Queries.view model
      4 -> Reviews.view model
      5 -> Schedules.view model
      _ -> viewStepper404 model


stepperTabLabel : String -> Tabs.Label a
stepperTabLabel string =
  Tabs.label
    [ Options.center
    , Options.css "cursor" "default" ] 
    [ text string ]

viewStepper : Data.Model -> Html Data.Msg
viewStepper model = 
  Options.div
    []
    [ Tabs.render Data.Mdl [0] model.mdl
      [ Tabs.onSelectTab Data.SelectStepperTab
      , Tabs.activeTab model.stepperTab ]
      [ stepperTabLabel "Past Jobs"
      , stepperTabLabel "New Job"
      , stepperTabLabel "Templates"
      , stepperTabLabel "Queries"
      , stepperTabLabel "Reviews"
      , stepperTabLabel "Schedules" 
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

viewTypes : List ( Data.Model -> Html Data.Msg )
viewTypes =
  [ Jobs.viewPastJobs
  , Jobs.viewNewJob
  , Templates.view
  , Queries.view
  , Reviews.view
  , Schedules.view
  , viewStepper404
  ]