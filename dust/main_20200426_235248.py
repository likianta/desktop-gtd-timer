from PySide2.QtWidgets import *

from src.pyui.window import Window


class App(QApplication):
    
    def __init__(self, appname):
        super().__init__()
        self.appname = appname


def launch():
    app = App('GTD Timer')
    # noinspection PyUnusedLocal
    win = Window(app.appname)
    app.exec_()


if __name__ == '__main__':
    launch()
