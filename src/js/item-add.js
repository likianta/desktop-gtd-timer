function addTimerItem(duration) {
    var component = Qt.createComponent("./TimerItem.qml")
    var item = component.createObject(_grid)
    item.p_text = TimeCalc.minutesUnit2Label(duration)
}
