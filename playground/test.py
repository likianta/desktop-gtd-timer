import sys

from lk_utils.lk_logger import lk
from PySide2.QtCore import *
from PySide2.QtQml import *
from PySide2.QtQuick import *
from PySide2.QtWidgets import QApplication

app = QApplication()
engine = QQmlApplicationEngine('./view.qml')
root = engine.rootObjects()[0]

view = root.findChild(QObject, 'my_listview')  # type: QObject
# lk.loga(view, view.property('count'))
# lk.loga(view.metaObject())

# lk.loga(view.property('currentIndex'), view.property('currentItem'))
# item = view.property('currentItem')  # type: QQuickItem
# lk.loga(item.property('text'))

# lk.loga(view.dynamicPropertyNames())
for i in range(view.property('count')):
    view.setProperty('currentIndex', i)
    item = view.property('currentItem')
    lk.loga(item.property('text'))

# model = view.property('model')  # type: QAbstractListModel
# lk.loga(len(model.children()), model.children())
# lk.loga(model.property('name'))
#
# delegate = view.property('delegate')  # type: QQmlComponent
# lk.loga(len(delegate.children()), delegate.children())

sys.exit(app.exec_())
