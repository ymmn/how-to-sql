import Html exposing (div, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import StartApp.Simple as StartApp


main =
  StartApp.start { model = model, view = view, update = update }


model = 1


view address model =
  div [ class "container" ]
    [ div [ class "sidebar" ] [ text "How 2 Sql" ]
    , div [ class "mainSection" ] [ text "content" ]
    ]


update action model =
  model

