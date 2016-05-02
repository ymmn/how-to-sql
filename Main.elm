import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Signal, Address)
import StartApp.Simple as StartApp


---- MODEL ----

type alias Model =
    { showSql : Bool, radioOn : Bool }


model : Model
model =
    { showSql = False, radioOn = False }


---- UPDATE ----


type Action
    = NoOp
    | GenerateSql
    | ToggleRadio


update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model

    GenerateSql ->
      { model | showSql = True }

    ToggleRadio ->
      { model | radioOn = not model.radioOn }



---- VIEWS ----


view address model =
  div [ class "container" ]
    [ div [ class "sidebar" ]
          [ h1
              [ class "logo"]
              [ text "How to Sql"]
          ]
    , renderMainSection address model
    ]

renderEmptyHtml : Html
renderEmptyHtml =
  text ""


renderMainSection : Address Action -> Model -> Html
renderMainSection address model =
  let
    sqlSectionHtml =
      if model.showSql then renderSqlSection else renderEmptyHtml
  in
    div [ class "mainSection" ]
      [ renderRadioButton address model.radioOn
      , button
          [ class "generateSqlBtn"
          , onClick address GenerateSql ]
          [ text "Generate Sql" ]
      , sqlSectionHtml
      ]


renderRadioButton : Address Action -> Bool -> Html
renderRadioButton address radioOn =
  let
    classname = if radioOn then "radioBtn selected" else "radioBtn"
  in
    div
      [ class classname
      , onClick address ToggleRadio
      ]
      [ text "Radio Button" ]


renderSqlSection : Html
renderSqlSection =
  pre [ class "sqlCode" ]
    [ text "ALTER TABLE foo;" ]


---- INPUTS ----


main =
  StartApp.start { model = model, view = view, update = update }
