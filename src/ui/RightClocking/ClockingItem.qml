import QtMultimedia 5.14
import QtQml 2.14
import QtQuick 2.14
import "../Basic" as Basic
import "../../js/time-calc.js" as TimeCalc

Item {
    id: _root
    width: 420; height: 80

    property bool p_playing: false
    property int p_index: 0
    property int p_duration: 0
    property string p_clock: "00:00:00"

    //signal fn_destroyClockingItem(int index)
    //signal alarming()  // when clock goes to zero, alarming.

    // header
    Basic.Text {
        id: _header
        anchors {
            left: _root.left
            leftMargin: 10
            right: _root.right
            rightMargin: 10
        }
        height: 18
        text: "Timer " + p_index
    }

    // timer bar
    Basic.Button {
        id: _bar
        anchors.top: _header.bottom
        width: 420; height: 62

        p_defaultColor: "#F2F2F2"
        p_enableShadow: true

        // clocking
        obj_Text {
            id: _txt
            //anchors.left: _bar.left
            //anchors.leftMargin: 20
            //anchors.verticalCenter: _bar.verticalCenter
            anchors {
                left: _bar.left
                leftMargin: 20
                verticalCenter: _bar.verticalCenter
            }
            font.pixelSize: 28
            text: p_clock
        }

        // TODO: more buttons

        obj_MouseArea {
            onClicked: {
                // TODO: 现有的方法是: 只要点击此控件, 就移除此控件. 未来将修改
                //  为: 点击此控件, 先判断 p_duration <= 0, 条件成立则移除控件.
                _audio.stop()
                py_clocking_listview_model.delete_item(p_index - 1)
                // | if (p_playing) {
                // |     p_playing = false
                // |     _audio.stop()
                // |     py_clocking_listview_model.delete_item(p_index - 1)
                // | }
            }
        }
    }

    Audio {
        id: _audio
        loops: 3
        source: "../../../res/ringtone/tethys.mp3"
    }

    function fn_updateClock() {
        p_duration -= 1
        p_clock = TimeCalc.secs2clock(p_duration)
        return p_duration
    }

    function fn_alarming() {
        p_playing = true
        _audio.play()
    }

    //Timer {
    //    // https://blog.csdn.net/xuqiang918/article/details/51669981
    //    id: _timer
    //    interval: 1000
    //    repeat: true
    //    running: true
//
    //    onTriggered: {
    //        // NOTE: if you wanna test, set the threshold number to 597.
    //        if (p_duration <= 0) {
    //            _timer.stop()
    //            p_playing = true
    //            return _audio.play()
    //        }
    //        p_duration -= 1
    //        p_clock = TimeCalc.secs2clock(p_duration)
    //    }
    //}
}
