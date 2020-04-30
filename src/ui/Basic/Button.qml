import QtGraphicalEffects 1.14
import QtQuick 2.14
import "./" as My

Rectangle {
    id: _root
    color: _mouseArea.containsMouse ? p_accentColor : p_defaultColor
    radius: 8

    // shadow effect (default off)
    layer.enabled: p_enableShadow
    layer.effect: DropShadow {
        horizontalOffset: 5
        verticalOffset: 5
        color: "#65BCBCBC"
    }

    property alias obj_MouseArea: _mouseArea
    property alias obj_Text: _txt
    property bool p_enableShadow: false
    property bool p_select: false
    property int p_fontSize: 14
    property string p_accentColor: "#CCEDFB"
    property string p_defaultColor: "white"
    property string p_text: ""

    My.Text {
        id: _txt
        anchors.centerIn: _root
        font.pixelSize: p_fontSize
        text: p_text
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
    }
}
