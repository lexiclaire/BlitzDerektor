module Derektor.Derektor exposing (..)

import Html exposing (..)
import Html.Attributes exposing (href, class, style, src)

import Material.Color as Color
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Tabs as Tabs

import Derektor.Data as Data
import Derektor.Jobs as Jobs
import Derektor.Templates as Templates
import Derektor.Queries as Queries
import Derektor.Reviews as Reviews
import Derektor.Schedules as Schedules

-- UPDATE

-- VIEW


viewHeader : Data.Model -> Html Data.Msg
viewHeader model =
  Options.div
    [ Options.css "background-color" "#ffffff" ]
    [ h1
      [ style
        [ ( "padding", "2rem" ) ]
      ]
      [ text "BlitzDerektor" ]
    ]

stepperTab : Data.Model -> Html Data.Msg
stepperTab model =
  case model.stepperTab of
      0 -> Jobs.view model
      1 -> Templates.view model
      2 -> Queries.view model
      3 -> Reviews.view model
      4 -> Schedules.view model
      _ -> Jobs.view model

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
      [ stepperTabLabel "Jobs"
      , stepperTabLabel "Templates"
      , stepperTabLabel "Queries"
      , stepperTabLabel "Reviews"
      , stepperTabLabel "Schedules" 
      ]
      []
    ]

mainGrid : Data.Model -> Html Data.Msg
mainGrid model =
  Options.div
  []
  [ grid 
    [ Options.css "width" "100%"
    , Options.css "position" "fixed"
    , Options.css "z-index" "1"
    , Options.css "padding" "0px 8px" ]
    [ cell
      [ size All 12
      , Options.css "margin" "0px 8px" ]
      [ viewStepper model ]
    ]
  ]

viewTypes : List ( Data.Model -> Html Data.Msg )
viewTypes =
  [ Jobs.view
  , Templates.view
  , Queries.view
  , Reviews.view
  , Schedules.view
  ]

jobsTab : Data.Model -> Html Data.Msg
jobsTab model =
  case model.jobsTab of
      0 -> Jobs.viewPastJobs model
      1 -> Jobs.viewNewJob model
      _ -> Jobs.viewPastJobs model

stepperNav : Data.Model -> Html Data.Msg
stepperNav model =
  grid
      [ Options.css "width" "100%" 
      , Options.css "margin" "0px" 
      , Options.css "padding" "0px"
      ]
      [ cell
        [ size All 12
        , Options.css "position" "fixed"
        , Options.css "width" "100%" ]
        [ viewStepper model
        , model |> (List.drop model.stepperTab viewTypes |> List.head |> Maybe.withDefault Templates.view) 
        ]
      ]