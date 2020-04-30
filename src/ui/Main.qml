import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Window 2.12
import "./LeftMenu" as LeftMenu
import "./MiddleSpec" as MiddleSpec
import "./RightClocking" as RightClocking

Window {
    color: "#FFDDBB"
    title: "GTD Timer"
    visible: true
    width: 1060; height: 610

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        LeftMenu.Main {
            id: _leftMenu
            width: 170
            Layout.fillHeight: true
        }

        MiddleSpec.Main {
            id: _middleSpec
            p_index: _leftMenu.p_index
            width: 390
            Layout.fillHeight: true
        }

        RightClocking.Main {
            id: _rightClocking
            width: 460
            Layout.fillHeight: true
        }
    }

    Component.onCompleted: {
        //py_handler._detect()
    }
}
