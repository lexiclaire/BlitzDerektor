module Derektor.Queries exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List
import Material.Tabs as Tabs

import Derektor.Data as Data

-- QUERIES

viewQueries : Data.Model -> Html Data.Msg
viewQueries model =
  grid
    []
    [ queriesTimeFilterPane model
    , singleQueryPane model ]

queriesTimeFilterPane : Data.Model -> Cell Data.Msg
queriesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ Tabs.render Data.Mdl [0] model.mdl
        [ Tabs.onSelectTab Data.SelectQueriesTab
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

singleQueryPane : Data.Model -> Cell Data.Msg
singleQueryPane model =
  cell
    [ size All 6 ]
    [ Tabs.render Data.Mdl [0] model.mdl
      [ Tabs.onSelectTab Data.SelectQueriesTabRight 
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

