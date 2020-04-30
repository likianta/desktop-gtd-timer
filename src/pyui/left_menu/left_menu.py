from PySide2.QtWidgets import *

from src.pyui.left_menu.nav_item import NavItem


class LeftMenu(QWidget):
    
    def __init__(self, parent):
        super(QWidget, self).__init__(parent)
        self._init_ui()

    def _init_ui(self):
        # === create views ===
        children = (
            NavItem(self, 'QUICK'),
            NavItem(self, 'ADVANCED'),
            NavItem(self, 'HISTORY'),
            NavItem(self, 'ABOUT'),
            NavItem(self, 'SETTINGS'),
        )
        # children = (
        #     QPushButton('QUICK', self),
        #     QPushButton('ADVANCED', self),
        #     QPushButton('HISTORY', self),
        #     QPushButton('ABOUT', self),
        #     QPushButton('SETTINGS', self),
        # )
    
        # === decorate views ===
        pass
    
        # === orgnize views ===
        layout = QVBoxLayout(self)
        for i in children:
            layout.addWidget(i)
        self.setLayout(layout)
        
        # === show views ===
        self.show()
