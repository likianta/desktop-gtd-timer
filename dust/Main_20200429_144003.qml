import QtQuick 2.14
import "../../../RightClocking" as RightClocking
import "../../../../js/time-calc.js" as TimeCalc

Grid {
    id: _grid
    objectName: "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid"

    bottomPadding: 20; topPadding: 40
    columns: 3
    horizontalItemAlignment: Grid.AlignHCenter; verticalItemAlignment: Grid.AlignVCenter
    spacing: 15

    QtObject {
        objectName: "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml"
        //property alias p_model: _repeater.model
    }

    function fn_addItem(index, duration) {
        var component = Qt.createComponent("./TimerItem.qml")
        var item = component.createObject(_grid)
        item.p_minutes = duration
        item.p_text = TimeCalc.minutesUnit2Label(duration)
        item.objectName = "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml"
                          + "#Grid.TimerItem" + index
        //console.log("obj name:", item.objectName)
    }

    Repeater {
        id: _repeater
        objectName: "src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid.Repeater"
        anchors.fill: parent
        delegate: TimerItem {
            p_minutes: duration
            p_text: clock
        }
    }

    Component.onCompleted: {
        // TEST
        for (var i = 1; i <= 24; i++) {
            fn_addItem(i, i * 10)
        }
    }
}
