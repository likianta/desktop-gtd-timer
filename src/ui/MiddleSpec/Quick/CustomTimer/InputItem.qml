import QtGraphicalEffects 1.14
import QtQuick 2.14
import "../../../Basic" as Basic

Item {
    property int p_number: 0
    property string p_unit: ""

    signal fn_numUp(string unit)
    signal fn_numDown(string unit)

    Rectangle {
        id: _rect
        color: "#F2F2F2"
        layer.enabled: true
        layer.effect: DropShadow {
            horizontalOffset: 5
            verticalOffset: 5
            color: "#65BCBCBC"
        }
        radius: 8
        width: 120; height: 60

        Basic.Text {
            anchors.centerIn: parent
            font.pixelSize: 36
            text: p_number
        }

        MouseArea {
            width: parent.width / 2
            height: parent.height
            anchors.left: parent.left
            onClicked: {
                fn_numDown(p_unit)
            }
        }

        MouseArea {
            //anchors.fill: parent
            width: parent.width / 2
            height: parent.height
            anchors.right: parent.right
            onClicked: {
                fn_numUp(p_unit)
            }
        }
    }

    Basic.Text {
        anchors.bottom: _rect.bottom
        anchors.left: _rect.right
        anchors.leftMargin: 10
        font.pixelSize: 36
        text: p_unit
    }
}
