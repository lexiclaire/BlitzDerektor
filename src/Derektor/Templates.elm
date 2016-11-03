module Derektor.Templates exposing (..)

import Html.App as App
import Html exposing (..)
import Material
import Material.Grid exposing (..)
import Material.Options as Options
import Material.Color as Color
import Material.List as List
import Material.Tabs as Tabs

import Derektor.Data as Data

-- TEMPLATES

viewTemplates : Data.Model -> Html Data.Msg
viewTemplates model =
  grid
    []
    [ templatesTimeFilterPane model
    , singleTemplatePane model ]

templatesTimeFilterPane : Data.Model -> Cell Data.Msg
templatesTimeFilterPane model =
  cell
    [ size All 6 ]
    [ Options.div
      [ Color.background ( Color.color Color.Teal Color.S50)
      , Options.css "min-height" "70%" ]
      [ Tabs.render Data.Mdl [0] model.mdl
        [ Tabs.onSelectTab Data.SelectTemplatesTab
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

singleTemplatePane : Data.Model -> Cell Data.Msg
singleTemplatePane model =
  cell
    [ size All 6 ]
    [ Tabs.render Data.Mdl [0] model.mdl
      [ Tabs.onSelectTab Data.SelectTemplatesTabRight 
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