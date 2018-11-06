module Color exposing (Color(..), colorToString, getAllColors, stringToColor)


type Color
    = Red
    | Orange
    | Yellow
    | Green
    | Blue
    | Purple


getAllColors : List Color
getAllColors =
    [ Red, Orange, Yellow, Green, Blue, Purple ]


colorToString : Color -> String
colorToString color =
    case color of
        Red ->
            "Red"

        Orange ->
            "Orange"

        Yellow ->
            "Yellow"

        Green ->
            "Green"

        Blue ->
            "Blue"

        Purple ->
            "Purple"


stringToColor : String -> Color
stringToColor str =
    case str of
        "Red" ->
            Red

        "Orange" ->
            Orange

        "Yellow" ->
            Yellow

        "Green" ->
            Green

        "Blue" ->
            Blue

        "Purple" ->
            Purple

        _ ->
            Red
