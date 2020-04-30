from PySide2.QtWidgets import *


class NavItem(QPushButton):
    
    def __init__(self, parent, text):
        super().__init__(parent)
        self.setText(text)
        self._init_ui()

    def _init_ui(self):
        # === create views ===
        pass
    
        # === decorate views ===
        self.setFixedHeight(50)
    
        # === orgnize views ===
        pass
    
        # === show views ===
        # self.show()
