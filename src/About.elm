module About exposing (..)

import Html exposing (..)

import Material.Card as Card
import Material.Options as Options exposing (css, when, styled)
import Material.Typography as Typo
import Main exposing (model)

--Messages
type Msg
  = ShowAbout
  | ShowCaseStudy
  | Raise Int

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
            [ text "I have a Retailing and Consumer Science degree from the University of Arizona. I found User Experience Design just over four months ago and felt that it fit my personality. I love being able to discover ways to apply design thinking principles to solve people's biggest pain points as well as finding solutions. By designing apps to improve people's lives my design skills have become more defined." ]
          , Card.text []
            [ text "If you want to take a look at my resume click here or send an email" ]
        ]

--page : Model -> Html Msg
--page model =
  --div []
      --[
       --Options.styled p
          --[ Typo.display4
            --, Options.css "display" "block"
            --, Options.css "font-size" "2em"
            --, Options.css "margin-top" "1em"
            --, Options.css "margin-left" "8px"
          --]
          --[ text ""
          --]
        --, Options.styled p
          --[ Typo.display4
            --, Options.css "display" "block"
            --, Options.css "font-size" "2em"
            --, Options.css "margin-top" "1em"
            --, Options.css "margin-left" "8px"
          --]
          --[ aboutCard model
          --]
      --]
