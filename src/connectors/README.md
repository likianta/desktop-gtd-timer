# 模块说明

本模块用于在 QML 完全加载完成后, 对 QML 中的对象进行高级的连接和通讯.

之所以使用本模块进行连接和通讯支持, 是因为:

1. QML 自身的逻辑方法的处理能力不强, 因此将这个部分移到 Python 中实现
2. 使 QML 专注于视图的呈现, 逻辑分离到 Python 代码以实现解耦合
3. 有些实例的 signal 只有在全局加载完成后才能彼此见到对方的实例, 因此它们的连接只能在全局实现

**场景演示**

假设有这样的 QML 结构:

```
ApplicationWindow {
    // 注: A, B, C, D 分属于不同的 qml 文件.
    A {
        SwipeView {
            B {
                C {
                    signal c()
                    onClicked: c()
                }
            }
        }
    }
    D {
        ListView {
            function d() {
                // 接收并处理 c 信号.
            }
            
            E {}
        }
    }
}
```

我们希望在 C 被点击时, D.ListView 内部会添加一个新的 E 对象. 也就是说 C 的信号要与 D.ListView 的方法进行 connect.

已知 signal 的连接的前提条件是双方必须完成实例化. 从上面的结构可以看到, 双方均完成实例化的时机是 ApplicationWindow 加载完成. 因此, 如果我们要在 QML 中完成这项连接活动, 就不得不在 ApplicationWindow 中进行连接:

```
ApplicationWindow {
    // 注: A, B, C, D 分属于不同的 qml 文件.
    A {
        SwipeView {
            B {
                C {
                    signal c()
                    onClicked: c()
                }
            }
        }
    }
    D {
        ListView {
            function d() {
                // 接收并处理 c 信号.
            }
            
            E {}
        }
    }
    
    // connection
    Component.onCompleted: {
        // trying to accomplish `c.connect(d)`, but first we should locate where
        // are C and D.ListView.
    }
}
```

然后考虑到 signal c 和 function d 位于不同的 qml 文件, 在主文件 import 的时候已经经历了层层嵌套, 早已丢失了对它俩的索引, 所以还要先在 ApplicationWindow 中找到 C 和 D 对象才行, 而 QML 的 findChild 方法非常难用, 毫无疑问在 QML 中完成这项工作已经成为了一种折磨.

这就是为什么使用本模块实现的原因. 本模块通过 objectName, 只需一行代码就能在全局定位到目标对象, 从而快速完成 connect.

# objectName 命名规范

详见 [docs/qml 命名规范 (自定义).md](../../docs/qml%20命名规范%20(自定义).md)
