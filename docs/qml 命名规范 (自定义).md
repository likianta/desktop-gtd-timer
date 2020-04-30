*注: 以下规范仅为个人约定, 不具有强制性.*

# 属性命名

```
import QtQuick 2.14

Rectangle {
    color: _mouseArea.containsMouse ? "gray" : "white"

    property int p_index: 0  // 暴露到外部并可由外部访问的属性, 用 "p_" 开头.
    property string p_text: "Hello"
    property alias obj_mouseArea: _mouseArea  // 特别的, 如果要暴露子对象到外界, 
    // 则使用 "obj_" 开头.

    signal fn_activate(int index)  // 信号用 "fn_" 开头.

    Text {
        anchors.centerIn: parent
        text: p_text
    }

    MouseArea {
        id: _mouseArea  // 仅当前组件文件内可访问的名称, 用下划线开头.
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            fn_activate(p_index)
        }
    }
}
```

# 属性书写顺序

*本节内容仅用于自主规范, 以便提高审阅效率.*

1. `id` 始终位于首行, `objectName` 位于第二行
2. 其他属性按照字母表排列
    1. 对于某些关联性强的元素, 可以单独空一行书写
       ```
        // e.g.
        Text {
            id: _txt
            color: "black"
            text: "hello"
            
            font.bold: true
            font.family: "Microsoft YaHei"
            font.italic: true
        }
       ```
    2. 对于关联性强的元素, 如果不是很长的话, 可以合并到一行书写 (在该行内的属性书写顺序无需遵守字母表顺序)
       ```
        // e.g.
        Rectangle {
            id: _rect
            anchors.fill: parent
            color: "white"
            width: 100; height: 100
        }
       ```

# objectName 命名格式

格式: `{当前 qml 的文件路径}#{当前 qml 对象层级}`

示例:

```
// === demo/A/B/C.qml ===
import QtQuick 2.14

Rectangle {
    objectName: "demo/A/B/C.qml#Rectangle"

    Text {
        objectName: "demo/A/B/C.qml#Rectangle.Text"
    }
}
```

注意: objectName 必须保证全局唯一.
