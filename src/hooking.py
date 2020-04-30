from PySide2.QtCore import *
from src.model import ClockingListviewModel
from src.core.eventbus import GlobalEventsHandler


def hookup_timer_item_2_clocking_list(
        container: QObject, model: ClockingListviewModel):
    for i in _get_children(container):
        i.fn_newClocking.connect(model.add_item)


def hookup_clocking_timer(timer: QObject, model: ClockingListviewModel):
    timer.triggered.connect(model.update_item_clocks)


# noinspection PyTypeChecker
def _get_children(view: QObject):
    """
    https://blog.csdn.net/Likianta/article/details/105863572
    :param view: supports: ListView, Repeater.
    :return: [QQuickItem]
    """
    children = []
    for i in range(view.property('count')):
        view.setProperty('currentIndex', i)
        item = view.property('currentItem')
        children.append(item)
    return children
