import QtQuick 2.14
import QtQuick.Window 2.12

Window {
    width: 100; height: 100
    visible: true

    Rectangle {
        Test2 {
            id: _t2
            p_txt {
                text: "world"
            }
        }
    }

    Component.onCompleted: {
        //console.log("hello")
        console.log(_t2.p_txt.text)
    }
}

