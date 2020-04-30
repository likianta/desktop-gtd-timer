import QtQuick 2.14
import QtQuick.Layouts 1.14

Rectangle {
    color: "#FFFF99"

    property int p_hr: 0
    property int p_min: 0

    InputItem {
        id: _item_hr
        x: 34; y: 25
        p_number: p_hr
        p_unit: "h"
    }

    InputItem {
        id: _item_min
        x: 195; y: 25
        p_number: p_min
        p_unit: "m"
    }

    function fn_numUps(unit) {
        //console.log("ln11: unit = ", unit, "; p_min = ", p_min)
        if (unit == "m") {
            const n = p_min + 10
            if (n == 60) {
                p_min = 0
                p_hr += 1
            } else {
                p_min = n
            }
        } else if (unit == "h") {
            p_hr += 1
        }
    }

    function fn_numDowns(unit) {
        //console.log("ln26: unit = ", unit, "; p_min = ", p_min)
        if (unit == "m" && p_min > 0) {
            p_min -= 10
        } else if (unit == "h" && p_hr > 0) {
            p_hr -= 1
        }
    }

    Component.onCompleted: {
        _item_hr.fn_numUp.connect(fn_numUps)
        _item_hr.fn_numDown.connect(fn_numDowns)
        _item_min.fn_numUp.connect(fn_numUps)
        _item_min.fn_numDown.connect(fn_numDowns)
    }
}
