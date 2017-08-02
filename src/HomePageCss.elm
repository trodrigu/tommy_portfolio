module HomePageCss exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = SuperImage


type CssIds
    = SuperImageTopLeft
    | SuperImageTopRight
    | SuperImageBottomLeft
    | SuperImageBottomRight
    | SickLogo
    | TravelBugPic


css : Stylesheet
css =
    (stylesheet << namespace "portfolio")
        [ class SuperImage
            [ margin auto
            , display block
            ]
        , id SuperImageTopLeft
            [ borderTopLeftRadius (em 5)
            ]
        , id SuperImageTopRight
            [ borderTopRightRadius (em 2)
            ]
        , id SuperImageBottomLeft
            [ borderBottomLeftRadius (em 2)
            ]
        , id SuperImageBottomRight
            [ borderBottomRightRadius (em 2)
            ]
        , id SickLogo
            [ width (em 5)
            ]
        , id TravelBugPic
            [ width (em 42)
            , marginLeft (em 20.3)
            , position absolute
            ]
        ]
