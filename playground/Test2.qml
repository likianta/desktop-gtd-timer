import QtQuick 2.14

Rectangle {
    color: "white"

    property alias p_txt: _txt

    Text {
        id: _txt
        text: "hello world"
    }
}
