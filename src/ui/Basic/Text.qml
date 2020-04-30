import QtQuick 2.14

Text {
    color: p_accent ? p_accentColor : p_defaultColor
    font.family: "Microsoft YaHei UI"
    font.pixelSize: p_fontSize

    property bool p_accent: false
    property int p_fontSize: 14
    property string p_accentColor: "#169BD5"
    property string p_defaultColor: "#333333"
}
