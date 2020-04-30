from PySide2.QtCore import *
from PySide2.QtQml import QQmlApplicationEngine
from lk_utils.lk_logger import lk


class TimerHooker:
    """
    https://www.cnblogs.com/ibgo/p/11589613.html
    """
    
    def __init__(self, engine: QQmlApplicationEngine):
        self.root = engine.rootObjects()[0]  # 必须用 self.root 维持 dom 树.
        
        def _get_timer_items():
            obj_name = 'src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid'
            grid = self.root.findChild(QObject, obj_name)  # type: QObject
            children = grid.findChildren(QObject, QRegExp(obj_name + '.+'))
            # lk.logt('[D5812]', len(children))
            return children
        
        def _binding_timer_item(item):
            item.fn_newClocking.connect(self._new_clocking)
            
        for i in _get_timer_items():
            _binding_timer_item(i)
            
        # clocking_list
        self.clocking_list = self.root.findChild(
            QObject, 'src/ui/RightClocking/Main.qml#Rectangle.ListView'
        )  # type: QObject
        # lk.logt('[D2445]', dir(self.clocking_list))

    def _new_clocking(self, duration: int):
        """
        when new clock set up, self.clocking_list should add a new
        ClockingItem.
        
        duration: unit is minute.
        """
        lk.loga(duration, type(duration))
        children = self.clocking_list.children()
        lk.logt('[D1626]', len(children))
        
        # noinspection PyTypeChecker
        model = self.clocking_list.property('model')  # type: QAbstractListModel
        model.beginInsertRows(QModelIndex(), len(children), len(children) + 1)
        model.endInsertRows()

