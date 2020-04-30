from lk_utils.lk_logger import lk
from PySide2.QtCore import *
from PySide2.QtWidgets import *


def t1(root: QObject, model):
    item = root.findChild(
        QObject,
        'src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid.Repeater.TimerItem10'
    )
    lk.loga(item, type(item))
    lk.loga(item.property('p_accentColor'))
    item.fn_newClocking.connect(model.add_item)


def t2(grid):
    children = grid.children()
    lk.loga(len(children))
    children2 = children[0].children()
    lk.loga(len(children2))
    for i in lk.count(children):
        lk.logax(i)
