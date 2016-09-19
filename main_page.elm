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

type Menu = MenuNew | MenuOptions

menuDisplay : Menu -> Html Msg
menuDisplay menu =
    case menu of
        MenuNew ->
            createNew

        MenuOptions ->
            createOptions    
    
type alias Model =
    { mdl : Material.Model
    , menuState : Bool       
    }

model : Model
model =
    { mdl = Material.model
    , menuState = False
    }

type Msg
    = Mdl (Material.Msg Msg)
    | MenuState

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model  

        MenuState ->
            ( { model 
            | menuState = True
            }, Cmd.none)      

-- VIEW


createButton : (Html Msg)
createButton =
    Layout.row [ Options.css "padding-left" "0px" ]
                [ Options.div [] [ Button.render Mdl [0] model.mdl
                                 [ Button.fab
                                 , Button.colored
                                 , Button.ripple
                                 , Button.onClick MenuState
                                 , Color.background (Color.color Color.LightBlue Color.S100)
                                 , Color.text (Color.color Color.DeepPurple Color.S500) ]
                                 [ text "+" ]
                                 ]
                ]

createNew : (Html Msg)
createNew =
    Options.div [ Options.css "padding-left" "15px" ] 
                [ text "CREATE NEW" ] 

createOptions : (Html Msg)
createOptions =
    Options.div [] [text "Create from template"
                    , text "Paste ad-hoc"]                


mainGrid : (Html Msg)
mainGrid =
    grid [ Options.css "width" "100%"]
        [ cell [ size All 6 ]
                [ createButton
                , Options.div [ Options.css "min-height" "75vh"]
                              [ Options.img [ Options.css "max-width" "100%" ] [ Html.Attributes.src "/assets/images/template.png" ] ]
                ]
        , cell [ size All 6 ]
                [ Options.div [ Color.background (Color.color Color.Teal Color.S50 )
                    , Options.css "min-height" "70%" ]
                    [ text "hi" ]
                , Options.div [ Color.background (Color.color Color.Pink Color.S50 )
                , Options.css "min-height" "30%" ] [ text "bye" ]
                ]
    ]

view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ h1 [ style [ ( "padding", "2rem" ) ] ] [ text "BlitzDerektor" ] ]
        , drawer = []
        , tabs = ( [], [] )
        , main = [ viewBody model ]
        }


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