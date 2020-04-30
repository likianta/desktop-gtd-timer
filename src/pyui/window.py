from PySide2.QtGui import *
from PySide2.QtWidgets import *
from res.spec.constant.geometry import *
from src.pyui.left_menu.left_menu import LeftMenu


class Window(QMainWindow):
    
    def __init__(self, appname):
        super().__init__()
        self.appname = appname
        self._init_ui()
    
    def _init_ui(self):
        # === create ===
        left_menu = LeftMenu(self)
        # middle_spec = MiddleSpec(self)
        # right_clocking = RightClocking(self)
        
        # === decorate ===
        self.setFont(QFont(family="Microsoft YaHei UI"))
        self.setMinimumSize(1060, 610)
        self.setPalette(QPalette(QColor('#FFDDBB')))
        self.setWindowIcon(QIcon('../res/icon/alarm.png'))
        self.setWindowTitle(self.appname)

        # === orgnize ===
        layout = QHBoxLayout()
        layout.addWidget(left_menu)
        layout.addWidget(QPushButton('test me'))
        self.setLayout(layout)
        
        # === show ===
        self.show()
