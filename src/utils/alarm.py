from PySide2.QtCore import *


class Alarm(QObject):
    
    # noinspection PyCallingNonCallable
    @Slot()
    def alarming(self):
        """
        调用 windows 通知, 产生横幅通知并播放声音.
        https://www.zhihu.com/question/41665250
        :return:
        """
        pass
