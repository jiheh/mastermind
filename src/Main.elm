module Main exposing (Msg(..), main, update, view)

import Browser
import Color exposing (Color(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    Browser.sandbox { init = initModel, update = update, view = view }



-- Model


type Mode
    = SetUp
    | Playing
    | Won
    | Lost


type alias Row =
    List Color


type Feedback
    = PositionMatch
    | ColorMatch
    | NoMatch


type Attempt
    = Attempt Row (List Feedback)


type alias Model =
    { remainingTries : Int
    , mode : Mode
    , solution : Row
    , attempts : List Attempt
    }


initModel : Model
initModel =
    { remainingTries = 10
    , mode = SetUp
    , solution = [ Red, Red, Red, Red ]
    , attempts = []
    }



-- Update


type Msg
    = EnterSolution Row
    | Guess Row
    | Respond
    | UpdateSolution String


update msg model =
    case msg of
        EnterSolution row ->
            model

        Guess row ->
            model

        Respond ->
            model

        UpdateSolution colorString ->
            let
                newColor =
                    Color.stringToColor colorString
            in
            { model | solution = [ newColor, newColor, newColor, newColor ] }



-- View


view : Model -> Html Msg
view model =
    case model.mode of
        SetUp ->
            renderEnterSolution model.solution

        _ ->
            div [] []


renderEnterSolution : Row -> Html Msg
renderEnterSolution solution =
    div []
        ([ h1 [] [ text "Enter solution" ] ]
            ++ List.repeat 4 renderDropDown
            ++ [ button [ onClick (EnterSolution solution) ] [ text "Submit" ] ]
        )


renderDropDown : Html Msg
renderDropDown =
    let
        colors =
            Color.getAllColors
    in
    select [ onInput UpdateSolution ] (List.map (\c -> renderOption c) colors)


renderOption : Color -> Html Msg
renderOption color =
    let
        str =
            Color.colorToString color
    in
    option [ value str ] [ text str ]
