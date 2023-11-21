import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Window {
    id: window

    flags: Qt.FramelessWindowHint

    visible: true
    color: "black"

    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    Column {

        id: leftPanelRow

        spacing: 15

        anchors { top: window.top; left: window.left; bottom: window.bottom }

        Label {

            id: account

            height: 50
            width: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: "A"
            font.pixelSize: width * 2 / 3

            color: "white"
            background: Rectangle { color: "red" }
        }

        Label {

            id: tasks

            height: 50
            width: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: "T"
            font.pixelSize: width * 2 / 3

            color: "white"
            background: Rectangle { color: "red" }
        }
    }
}
