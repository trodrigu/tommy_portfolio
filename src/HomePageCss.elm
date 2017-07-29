module HomePageCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, li)
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

css =
  (stylesheet << namespace "portfolio")
  [ (.) SuperImage
    [ margin auto
    , display block
    ]
  , (#) SuperImageTopLeft
    [ borderTopLeftRadius (em 5)
    ]
  , (#) SuperImageTopRight
    [ borderTopRightRadius (em 2)
    ]
  , (#) SuperImageBottomLeft
    [ borderBottomLeftRadius (em 2)
    ]
  , (#) SuperImageBottomRight
    [ borderBottomRightRadius (em 2)
    ]
  , (#) SickLogo
    [ width (em 5)
    ]
  , (#) TravelBugPic
    [ width (em 42)
    , marginLeft (em 20.3)
    , position absolute
    ]
  ]
