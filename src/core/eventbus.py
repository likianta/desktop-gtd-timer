from typing import Any

from lk_utils.lk_logger import lk
from PySide2.QtCore import *


# noinspection PyCallingNonCallable
class GlobalEventsHandler(QObject):
    
    def __init__(self):
        super().__init__()
        self.event_mgr = {}

    @Slot(str, int)
    def py_emit(self, fn_name: str, data: dict):
        lk.loga(type(data), data)
        lk.loga(fn_name, data)
        # if fn_name in self.event_mgr:
        #     return self.event_mgr[fn_name](**data)
    
    @Slot()
    def _detect(self):
        lk.log('handler running ok')

    def register(self, fn_name, fn):
        self.event_mgr[fn_name] = fn
