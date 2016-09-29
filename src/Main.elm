module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import UrlParser exposing(..)
import Material
import Material.Layout as Layout
import Material.Color as Color
import Material.Icon as Icon
import Material.Options as Options exposing (css, when)
import Navigation
import String exposing (dropLeft)


--Model

type alias Model = 
  { route : Route
  , mdl : Material.Model
  }

--Update

update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
  case message of
    Mdl message' ->
      Material.update message' model

    ShowHome ->
      ( model, Navigation.newUrl "/" )

    ShowResume ->
      ( model, Navigation.newUrl "/resume" )

    ShowAbout ->
      ( model, Navigation.newUrl "/about" )

    SuperImpose ->
      ( model, Cmd.none )
--Task

--View
page : Model -> Html Msg
page model =
  case model.route of
    HomeRoute ->
      homePage

    AboutRoute ->
      aboutPage

    ResumeRoute ->
      resumePage

    NotFoundRoute ->
      notFoundView

notFoundView : Html msg
notFoundView =
  div []
      [ text "Not found" ]

homePage : Html Msg
homePage =
  div []
      [
        a [ href "#", onClick ShowHome ]
          [ text "Go Home" ]
        , text "The Home Page"
      ]

aboutPage : Html Msg
aboutPage =
  div []
      [
        a [ href "#", onClick ShowHome ]
          [ text "Go Home" ]
        , text "The About Page"
      ]

resumePage : Html Msg
resumePage =
  div []
      [
        a [ href "#", onClick ShowHome ]
          [ text "Go Home" ]
        , text "The Resume Page"
      ]


header : Model -> List (Html Msg)
header model =
  [ Layout.row
    [ css "transition" "height 333ms ease-in-out 0s"
    ]
    [ Layout.title [] [ text "Ashley's Portfolio" ]
    , Layout.spacer
    , Layout.navigation []
      [ Layout.link
        [ Layout.onClick ShowHome ]
        [ Icon.i "home" ]
      , Layout.link
        [ Layout.href "#about" ]
        [ span [] [ text "About" ] ]
      , Layout.link
        [ Layout.href "#resume" ]
        [ span [] [ text "Resume" ] ]
      ]
    ]
  ]

view : Model -> Html Msg
view model =
  Layout.render Mdl model.mdl
  [ Layout.fixedHeader
  ]
  { drawer = []
  , header = header model
  , main = [ div [] [ page model ] ]
  , tabs = ( [], [] )
  }

--Routing
type Route
 = HomeRoute
 | ResumeRoute
 | AboutRoute
 | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ format HomeRoute (UrlParser.s "")
    , format ResumeRoute (UrlParser.s "resume")
    , format AboutRoute (UrlParser.s "about")
    ]

hashParser : Navigation.Location -> Result String Route
hashParser location =
  location.hash
  |> String.dropLeft 1
  |> parse identity matchers

parser : Navigation.Parser (Result String Route)
parser =
  Navigation.makeParser hashParser

--Messages
type Msg
  = ShowHome
  | ShowResume
  | ShowAbout
  | SuperImpose
  | Mdl ( Material.Msg Msg)

--Main

initialModel : Model
initialModel =
  { route = HomeRoute
  , mdl = Material.model
  }

init : Result String Route -> (Model, Cmd Msg)
init result =
  (initialModel, Cmd.none)


subscriptions: Model -> Sub Msg
subscriptions model =
  Layout.subs Mdl Material.model

urlUpdate : Result String Route -> Model -> ( Model, Cmd Msg )
urlUpdate result model = 
  let
      currentRoute =
        routeFromResult result
  in
     ( { model | route = currentRoute }, Cmd.none )

routeFromResult : Result String Route -> Route
routeFromResult result =
  case result of
    Ok route ->
      route

    Err string ->
      NotFoundRoute

main : Program Never
main =
  Navigation.program parser
    { init = init
    , subscriptions = subscriptions
    , update = update
    , urlUpdate = urlUpdate
    , view = view
    }
