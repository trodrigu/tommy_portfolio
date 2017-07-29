module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)

import UrlParser exposing(..)
import Navigation

import Material
import Material.Layout as Layout
import Material.Color as Color
import Material.Icon as Icon
import Material.Options as Options exposing (css, when, styled)
import Material.Grid exposing (align, grid, cell, size, offset, Device(..))
import Material.Button as Button
import Material.Footer as Footer
import Material.Elevation as Elevation
import Material.Typography as Typo
import Material.Card as Card

import String exposing (dropLeft)

import Html.CssHelpers
import HomePageCss exposing (..)

--import About exposing (aboutCard)
aboutCard : Model -> Card
aboutCard model =
  let
      k = 201

  in
    Card.view
          [ Options.css "width" (toString wide ++ "px")
          , Color.background (Color.color Color.Blue Color.S500)
          , Options.css "margin" "auto"
          , Options.css "display" "block"
          , if model.raised == k then Elevation.e8 else Elevation.e2
          , Elevation.transition 250
          , Options.attribute <| onMouseEnter (Raise k)
          , Options.attribute <| onMouseLeave (Raise -1)
          ]
          [ Card.media
            [ Options.css "background" "url('dist/images/caticorn.jpg') center / cover"
            , Options.css "height" "617px"
            ]
            []
          , Card.title []
            [ Card.head
              [ Options.css "color" "#ffff" ]
              [ Options.styled h1
                  [ Typo.display4
                    , Options.css "display" "block"
                    , Options.css "font-size" "4em"
                    , Options.css "margin-top" "1em"
                    , Options.css "margin-left" "8px"
                  ]
                [ text "Tommy Rodriguez | Software Engineer" ]
              ]
            ]
          , Card.menu [] []
          , Card.text []
            [ text "Thomas Rodriguez is a developer in San Diego. He enjoys sand beneath his feet or the warm glow of vim." ]
          , Card.text []
            [ text "If you want to take a look at my resume click here or send an email" ]
        ]

{ id, class, classList } =
  Html.CssHelpers.withNamespace "portfolio"

--Model
type alias Model =
  { route : Route
  , mdl : Material.Model
  , raised : Int
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
      ( model, Navigation.newUrl "/#resume" )

    ShowAbout ->
      ( model, Navigation.newUrl "/#about" )

    ShowCaseStudy ->
      ( model, Navigation.newUrl "/#study" )

    SuperImpose ->
      ( model, Cmd.none )

    Raise k ->
      ( { model | raised = k }, Cmd.none )

--View
page : Model -> Html Msg
page model =
  case model.route of
    HomeRoute ->
      portfolioOverview model

    AboutRoute ->
      aboutPage

    ResumeRoute ->
      resumePage

    StudyRoute ->
      studyPage model

    NotFoundRoute ->
      notFoundView

notFoundView : Html Msg
notFoundView =
  div []
      [ text "Not found" ]

wide : Float
wide =
  350

type alias Card =
  Model -> Html Msg

studyCard : Card
studyCard model =
  let
      k = 200

  in
    Card.view
          [ Options.css "width" (toString wide ++ "px")
          , Color.background (Color.color Color.Blue Color.S500)
          , Options.css "display" "block"
          , Options.css "margin-right" "8em"
          , Options.css "margin-top" "4em"
          , Options.css "height" "11.3em"
          , if model.raised == k then Elevation.e8 else Elevation.e2
          , Elevation.transition 250
          , Options.attribute <| onMouseEnter (Raise k)
          , Options.attribute <| onMouseLeave (Raise -1)
          ]
          [ Card.title []
            [ Card.head
              [ Options.css "color" "#ffff" ]
              [ text "TravelBug!" ]
            ]
          , Card.text [ Options.css "color" "#ffff" ]
            [ text "Travel often and make it your own."
            ]
          , Card.actions
            [ Card.border ]
            [ Button.render Mdl [0, 1] model.mdl
              [ Button.ripple , Button.accent, Button.onClick ShowCaseStudy ]
              [ text "View Case Study" ]
            ]
          , Card.menu [] []

          ]

--mountain3 : Card
--mountain3 model =
  --let
      --k = 202

  --in
    --Card.view
          --[ Options.css "width" (toString wide ++ "px")
          --, Color.background (Color.color Color.Blue Color.S500)
          --, Options.css "margin" "auto"
          --, Options.css "display" "block"
          --, if model.raised == k then Elevation.e8 else Elevation.e2
          --, Elevation.transition 250
          --, Options.attribute <| onMouseEnter (Raise k)
          --, Options.attribute <| onMouseLeave (Raise -1)
          --]
          --[ Card.media
            --[ Options.css "background" "url('https://placekitten.com/400/200') center / cover"
            --, Options.css "height" (toString (wide/16 * 9) ++ "px")
            --]
            --[]
          --, Card.title []
            --[ Card.head
              --[ Options.css "color" "#ffff" ]
              --[ text "Cat Mountain" ]
            --]
          --, Card.menu [] []

        --]

--mountain4 : Card
--mountain4 model =
  --let
      --k = 203

  --in
    --Card.view
          --[ Options.css "width" (toString wide ++ "px")
          --, Color.background (Color.color Color.Blue Color.S500)
          --, Options.css "margin" "auto"
          --, Options.css "display" "block"
          --, if model.raised == k then Elevation.e8 else Elevation.e2
          --, Elevation.transition 250
          --, Options.attribute <| onMouseEnter (Raise k)
          --, Options.attribute <| onMouseLeave (Raise -1)
          --]
          --[ Card.media
            --[ Options.css "background" "url('https://placekitten.com/400/200') center / cover"
            --, Options.css "height" (toString (wide/16 * 9) ++ "px")
            --]
            --[]
          --, Card.title []
            --[ Card.head
              --[ Options.css "color" "#ffff" ]
              --[ text "TravelBug!" ]
            --]
          --, Card.menu [] []

        --]

portfolioOverview : Model -> Html Msg
portfolioOverview model =
  Options.div
    [ Options.css "background" "url('dist/images/mountain_lake.jpg') center / cover"
    , Options.css "height" "50rem"
    , Options.css "background-position" "-50rem"
    , Options.center
    ]
    [ Options.styled p
        [ Typo.display4
          , Options.css "color" "#5EB7EE"
          , Options.css "opacity" "1"
          , Options.css "margin" "auto"
          , Options.css "display" "block"
        ]
        [ text "Hi, I'm Ashley" ]
    ]

placeKitten : CssIds -> Html msg
placeKitten superImageClass =
  img [ src "http://placekitten.com/600/400", class [ HomePageCss.SuperImage ], id superImageClass ]
      []

travelBugPic : Html msg
travelBugPic =
  Options.div [ Elevation.e2
              , Options.css "width" "42em"
              , Options.css "position" "absolute"
              ]
    [
      img [ id TravelBugPic, src "dist/images/travel_bug_model_1.jpg" ]
      []
    ]

aboutPage : Model -> Html Msg
aboutPage model =
  div []
      [
       Options.styled p
          [ Typo.display4
            , Options.css "display" "block"
            , Options.css "font-size" "2em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text ""
          ]
        , Options.styled p
          [ Typo.display4
            , Options.css "display" "block"
            , Options.css "font-size" "2em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ aboutCard model
          ]
      ]

resumePage : Html Msg
resumePage =
  div []
      [
        a [ href "#", onClick ShowHome ]
          [ text "Go Home" ]
        , text "The Resume Page"
      ]

studyPage : Model -> Html Msg
studyPage model =
  div []
      [ Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "TravelBug! Mobile App" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Problem" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Solution" ]
      , div []
        [
          Button.render Mdl [0, 2] model.mdl
            [ Button.ripple , Button.onClick ShowCaseStudy ]
            [ text "Clickable Prototype" ]
        ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Overview" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Resarch And Analysis" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "User Stories" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Sitemap" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "Wireframes" ]
      , Options.styled p
          [ Typo.display4
            , Options.css "color" "#5EB7EE"
            , Options.css "display" "block"
            , Options.css "font-size" "5em"
            , Options.css "margin-top" "1em"
            , Options.css "margin-left" "8px"
          ]
          [ text "User Testing" ]
      ]

sickLogo : Html msg
sickLogo =
  img [ src "dist/images/logo.svg", id HomePageCss.SickLogo ] []

header : Model -> List (Html Msg)
header model =
  [ Layout.row
    [ Options.css "transition" "height 333ms ease-in-out 0s"
    ]
    [ Layout.title  [ Options.css "font-size" "2em" ] [ sickLogo ]
    , Layout.spacer
    , Layout.navigation []
      [ Layout.link
        [ Layout.onClick ShowHome
        , Layout.href "/"
        ]
        [ Icon.i "home" ]
      , Layout.link
        [ Layout.onClick ShowAbout
        , Layout.href "#about"
        ]
        [ span [] [ text "About" ] ]
      , Layout.link
        [ Layout.onClick ShowResume
        , Layout.href "#resume"
        ]
        [ span [] [ text "Resume" ] ]
      ]
    ]
  ]

footer : Html Msg
footer =
  Footer.mini []
    { left =
        Footer.left []
          [ Footer.logo [] [ Footer.html <| text "Tommy Rodriguez" ]
          , Footer.links []
              [ Footer.linkItem
                [ Footer.href "/"
                , Footer.onClick ShowHome
                ]
                [ Footer.html <| text "Home" ]
              , Footer.linkItem
                [ Footer.href "#about"
                , Footer.onClick ShowAbout
                ]
                [ Footer.html <| text "About" ]
              , Footer.linkItem
                [ Footer.href "#resume"
                , Footer.onClick ShowResume
                ]
                [ Footer.html <| text "Resume"]
              ]
          ]

  , right =
      Footer.right []
        [ Footer.logo [] [ Footer.html <| text "Mini Footer Right Section" ]
        , Footer.socialButton [Options.css "margin-right" "6px"] []
        , Footer.socialButton [Options.css "margin-right" "6px"] []
        , Footer.socialButton [Options.css "margin-right" "0px"] []
        ]
  }
view : Model -> Html Msg
view model =
  Layout.render Mdl model.mdl
  [ Layout.fixedHeader
  ]
  { drawer = []
  , header = header model
  , main =
    [ div []
      [ page model
      , footer
      ]
    ]
  , tabs = ( [], [] )
  }

--Routing
type Route
 = HomeRoute
 | ResumeRoute
 | AboutRoute
 | StudyRoute
 | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
  oneOf
    [ format HomeRoute (UrlParser.s "")
    , format ResumeRoute (UrlParser.s "resume")
    , format AboutRoute (UrlParser.s "about")
    , format StudyRoute (UrlParser.s "study")
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
  | ShowCaseStudy
  | SuperImpose
  | Raise Int
  | Mdl ( Material.Msg Msg)

--Main

initialModel : Model
initialModel =
  { route = HomeRoute
  , mdl = Material.model
  , raised = -1
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
