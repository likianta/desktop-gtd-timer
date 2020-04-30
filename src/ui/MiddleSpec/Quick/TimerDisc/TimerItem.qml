import "../../../Basic" as Basic

Basic.Button {
    //id: _root
    width: 100; height: 60

    p_accentColor: "#CCEDFB"
    p_defaultColor: "#F2F2F2"
    p_enableShadow: true
    p_fontSize: 18

    property int p_duration: 0

    obj_MouseArea {
        onClicked: {
            py_clocking_listview_model.add_item(p_duration)
        }
    }

}


