import QtQuick 2.14
import QtQuick.Layouts 1.14
import "../Basic" as Basic

Rectangle {
    color: _mouseArea.containsMouse && !p_select ? "#CCEDFB" : "transparent"
    height: 50
    Layout.fillWidth: true

    property bool p_select: false
    property string p_text: ""
    property int p_index: 0
    signal fn_select(int index)

    Basic.Text {
        //anchors.centerIn: parent
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        font.pixelSize: 18
        p_accent: p_select
        p_defaultColor: "#666666"
        text: p_text
        x: 20
    }

    MouseArea {
        id: _mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            fn_select(p_index)
        }
    }
}
