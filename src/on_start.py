from PySide2.QtCore import *

from src.model import ClockingListviewModel, TimerItemRepeaterModel
from src.conf import cfg


def main(timer_item_repeater, clocking_list):
    _restore_timer_items(timer_item_repeater)
    model = _restore_clocking_items(clocking_list)
    return model


# noinspection PyTypeChecker
def _restore_timer_items(container: QObject):
    container.setProperty('model', model := TimerItemRepeaterModel())
    for i in cfg.get_init_timer_items():
        # -> [10, 20, 30, 40, ..., 300]
        model.add_item(duration=i)
    return model


# noinspection PyTypeChecker
def _restore_clocking_items(container: QObject):
    """
    :param container: clocking_listview
    :return: model: ClockingListModel
    """
    container.setProperty('model', model := ClockingListviewModel())
    for i in cfg.get_init_clocking_items():
        model.add_item(duration=i)
    return model
