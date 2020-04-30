import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    objectName: "my_item"
    signal say(string s)

    Button {
        text: "hello"
        onClicked: py_handler.speak(text)
    }
}
