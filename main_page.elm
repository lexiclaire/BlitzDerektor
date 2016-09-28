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

type alias Model =
    { mdl : Material.Model 
    }

model : Model
model =
    { mdl = Material.model
    }

type Msg
    = Mdl (Material.Msg Msg)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model 

iconEmail : Html m 
iconEmail = Icon.i "email"            

-- VIEW             

mainGrid : (Html Msg)
mainGrid =
    grid [ Options.css "width" "100%"]
        [ cell [ size All 6 ]
                [ 
                ]
        , cell [ size All 6 ]
                [ Options.div [ Color.background (Color.color Color.Teal Color.S50 )
                    , Options.css "min-height" "70%" ]
                    [ text "hi" ]
                ]
    ]

view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ viewHeader ]
        , drawer = []
        , tabs = ( [], [] )
        , main = [ viewBody model ]
        }

viewHeader : Html Msg
viewHeader =
    Options.div [ Color.background (Color.color Color.Teal Color.S400)
 ]
    [ h1  [ style [ ( "padding", "2rem" ) ] ] 
          [ text "BlitzDerektor" ]
    , viewStepper
    ]

viewStepper : Html Msg
viewStepper = 
    Layout.row [ Options.css "display" "flex" 
                , Color.background (Color.color Color.Teal Color.S200) ]

                [ Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 1" ]
                , Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 2" ]
                , Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 3" ]
                , Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 4" ]
                , Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 5" ]
                , Options.div [ Options.css "width" "15%" ] 
                              [ iconEmail
                              , text "Step 6" ]
                ]

viewBody : Model -> Html Msg
viewBody model =
         mainGrid
        |> Material.Scheme.top

main : Program Never
main =
    App.program
        { init = ( model, Cmd.none )
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }