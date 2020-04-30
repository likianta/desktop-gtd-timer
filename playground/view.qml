// === view.qml ===
import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.12

Window {
    visible: true
    width: 600; height: 400

    Grid {
        objectName: "my_grid"
        width: 300; height: parent.height
        columns: 2

        Button { text: "Infantry" }
        Button { text: "Cavalry" }
        Button { text: "Archers" }
    }

    ListView {
        id: _listview
        objectName: "my_listview"

        anchors.right: parent.right
        width: 300; height: parent.height

        model: ListModel {
            ListElement { index: 1; name: "Bill Smith" }
            ListElement { index: 2; name: "John Brown" }
            ListElement { index: 3; name: "Sam Wise" }
        }
        delegate: Button {
            objectName: "lst_ele_" + model.index
            text: model.name
        }

        //Component.onCompleted: {
        //    console.log('list count', _listview.count)
        //    console.log('list contentItem length', _listview.contentItem.children.length)
        //    for (var i in _listview.contentItem.children) {
        //        var item = _listview.contentItem.children[i]
        //        console.log(
        //            'index =', i,
        //            '; text =', item.text,
        //            '; obj name =', item.objectName
        //        )
        //    }
        //}
    }


}
