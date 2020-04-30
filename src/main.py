import sys

from PySide2.QtCore import *
from PySide2.QtGui import QIcon
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

from src import on_start


def main():
    app = QApplication()
    app.setWindowIcon(QIcon('../res/icon/alarm.png'))
    
    engine = QQmlApplicationEngine('./ui/Main.qml')
    # engine.load(QUrl.fromLocalFile('./ui/Main.qml'))
    
    # after
    manager = QMLObjMgr(engine)
    
    # pre load, hook ups
    model = on_start.main(
        manager.timer_item_repeater, manager.clocking_listview)
    # hooking.hookup_timer_item_2_clocking_list(handler, model)
    # hooking.hookup_clocking_timer(manager.clocking_timer, model)
    
    global_injection({
        'py_clocking_listview_model': model
    }, engine)
    
    # TEST
    # lk.loga(manager.timer_item_repeater.children())
    # manager.context.setContextProperty('py_newClocking', model.add_item)
    # hook = HookingProxy(engine, model)
    
    sys.exit(app.exec_())


def global_injection(inject: dict, engine):
    """
    
    :param inject: {py_fn_name: py_obj}
    :param engine:
    :return:
    """
    context = engine.rootContext()
    for k, v in inject.items():
        context.setContextProperty(k, v)


class QMLObjMgr:
    
    def __init__(self, engine: QQmlApplicationEngine):
        self.root = engine.rootObjects()[0]
        self.context = engine.rootContext()
        
        self.timer_grid = self.find_obj(
            'src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid')
        self.timer_item_repeater = self.find_obj(
            'src/ui/MiddleSpec/Quick/TimerDisc/Main.qml#Grid.Repeater')
        self.clocking_listview = self.find_obj(
            'src/ui/RightClocking/Main.qml#Rectangle.ListView')
        self.clocking_timer = self.find_obj(
            'src/ui/RightClocking/Main.qml#Rectangle.Timer')
        
        # print('[TEMPRINT]', self.timer_grid)
    
    def find_obj(self, obj_name: str) -> QObject:
        return self.root.findChild(QObject, obj_name)


if __name__ == '__main__':
    main()
