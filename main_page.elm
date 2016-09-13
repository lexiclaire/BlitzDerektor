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

type alias Model =
    { count : Int
    , mdl :
        Material.Model
    }


model : Model
model =
    { count = 0
    , mdl =
        Material.model
    }

type Msg
    = Increase
    | Reset
    | Mdl (Material.Msg Msg)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increase ->
            ( { model | count = model.count + 1 }
            , Cmd.none
            )

        Reset ->
            ( { model | count = 0 }
            , Cmd.none
            )

        Mdl msg' ->
            Material.update msg' model



-- VIEW


type alias Mdl =
    Material.Model

mainGrid : (Html a)
mainGrid =
    grid [ Options.css "width" "100%" ]
        [ cell [ size All 6 ]
            [ h4 [] [ text "left column" ]
            , Options.img [ Options.css "width" "100%" ] [ Html.Attributes.src "/assets/images/template.png"]
            ]
        , cell [ size All 6
                , Color.background (Color.color Color.Teal Color.S50)]
            [ h4 [] [ text "right column" ]
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