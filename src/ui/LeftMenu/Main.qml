import QtQuick 2.14
import QtQuick.Layouts 1.14

Rectangle {
    color: "white"
    radius: 8

    property int p_index: 0

    ColumnLayout {
        id: _columnLayout
        spacing: 0
        width: parent.width
        y: 40
    }

    function fn_addItem(index, text) {
        var component = Qt.createComponent("./NavItem.qml")
        var item = component.createObject(_columnLayout)

        // console.log(index, text, parent.width)
        item.p_index = index
        item.p_text = text

        item.fn_select.connect(fn_selectControl)
    }

    function fn_selectControl(index) {
        p_index = index  // record current index to expose to outer space.

        for (var i in _columnLayout.children) {
            const item_index = _columnLayout.children[i].p_index
            const curr_index = index
            _columnLayout.children[i].p_select = item_index == curr_index
        }
    }

    Component.onCompleted: {
        fn_addItem(0, "QUICK")
        fn_addItem(1, "ADVANCED")
        fn_addItem(2, "HISTORY")
        fn_addItem(3, "ABOUT")
        fn_addItem(4, "SETTINGS")

        fn_selectControl(0)
    }
}
