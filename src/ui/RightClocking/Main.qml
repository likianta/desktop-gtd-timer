import QtQuick 2.14
import "../MiddleSpec/Quick/TimerDisc" as TimerDisc
import "../../js/time-calc.js" as TimeCalc

Rectangle {
    id: _rect
    clip: true
    color: "white"
    radius: 8

    ListView {
        id: _listview
        objectName: "src/ui/RightClocking/Main.qml#Rectangle.ListView"
        anchors.fill: _rect
        anchors.topMargin: 20
        delegate: ClockingItem {
            anchors.horizontalCenter: parent.horizontalCenter
            p_index: index
            p_duration: duration
            p_clock: clock
        }
        spacing: 20
    }

    Timer {
        // https://blog.csdn.net/xuqiang918/article/details/51669981
        id: _timer
        objectName: "src/ui/RightClocking/Main.qml#Rectangle.Timer"
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            //py_clocking_listview_model.update_item_clocks()

            // https://forum.qt.io/topic/53965/loop-through-the-delegate-of
            // -listview/4
            var _item
            for(var i in _listview.contentItem.children) {
                _item = _listview.contentItem.children[i]
                if (_item.p_duration > 0) {
                    _item.fn_updateClock()
                } else if (_item.p_duration == 0) {
                    _item.p_duration -= 1
                    _item.fn_alarming()
                }
            }
        }
    }

    Component.onCompleted: {
    }
}
