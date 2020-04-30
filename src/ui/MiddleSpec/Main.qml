import QtQuick 2.14
import QtQuick.Controls 2.14

Rectangle {
    clip: true
    color: "white"
    radius: 8

    property int p_index: 0

    SwipeView {
        id: _swipeView
        anchors.fill: parent
        currentIndex: p_index
    }

    function fn_addItem(widget) {
        var component = Qt.createComponent(widget)
        var item = component.createObject(_swipeView)
        //console.log("src/ui/MiddleSpec/Main.qml", item.p_name)  // TEST
    }

    Component.onCompleted: {
        // according to [src/ui/LeftMenu/Main.qml]
        // TODO: in the future i will merge the two functions into one manager.
        fn_addItem("./Quick/Main.qml")
        fn_addItem("./Advanced/Main.qml")
        fn_addItem("./History/Main.qml")
        fn_addItem("./About/Main.qml")
        fn_addItem("./Settings/Main.qml")
    }
}
