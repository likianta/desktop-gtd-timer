from PySide2.QtGui import QFont
from PySide2.QtWidgets import *


_stylesheet = """
QPushButton {
    background-color: "
}
"""


class Button(QPushButton):
    
    def __init__(self, text, width, height, color, font: dict,
                 radius=8, shadow=False):
        super().__init__()
        
        self.resize(width, height)
        
        self.setFont(QFont('Microsoft YaHei UI', font.get('size', 10)))
        self.setText(text)
        
        # set round corner
        self.setStyleSheet(
            replace(
                """
                QPushButton {
                    background-color: [color]
                    border-radius: [radius]px
                    color: "#666666"
                    hover {
                        color: "#CCEDFB"
                    }
                }
                """,
                {
                    '[color]': color,
                    '[radius]': radius
                }
            )
        )
        
    def _set_shadow_effect(self, x, y, radius):
        # https://forum.qt.io/topic/41975/setstylesheet-to-qpushbutton-box-shado
        # w/8
        effect = QGraphicsDropShadowEffect()
        effect.setBlurRadius(radius)
        effect.setOffset(x, y)
        self.setGraphicsEffect(effect)
    
        
def replace(text: str, rep: dict):
    for k, v in rep.items():
        text = text.replace(k, str(v))
    return text
