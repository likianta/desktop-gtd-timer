import QtQuick 2.14
import "../../../RightClocking" as RightClocking

Grid {
    id: _grid
    objectName: "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid"

    bottomPadding: 20; topPadding: 40
    columns: 3
    horizontalItemAlignment: Grid.AlignHCenter; verticalItemAlignment: Grid.AlignVCenter
    spacing: 15

    Repeater {
        id: _repeater
        objectName: "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid.Repeater"
        anchors.fill: parent
        delegate: TimerItem {
            p_duration: duration
            p_text: clock
        }
    }
}
