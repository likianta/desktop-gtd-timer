import QtQuick 2.14
import QtQuick.Controls 2.14
import "./CustomTimer" as CustomTimer
import "./TimerDisc" as TimerDisc

Item {
    property string p_name: "src/ui/MiddleSpec/Quick/Main.qml"

    ScrollView {
        x: 25
        width: parent.width - 25
        height: parent.height - _customTimer.height - 5
        clip: true
        TimerDisc.Main {
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    CustomTimer.Main {
        id: _customTimer
        anchors.bottom: parent.bottom
        width: parent.width
        height: 120
    }
}
