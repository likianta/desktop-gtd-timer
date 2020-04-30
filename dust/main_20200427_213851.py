import sys

from PySide2.QtCore import QUrl
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication

from src.connectors.timer_hooker import TimerHooker

app = QApplication()
engine = QQmlApplicationEngine()
engine.load(QUrl.fromLocalFile('./ui/Main.qml'))
hooker = TimerHooker(engine)
sys.exit(app.exec_())
