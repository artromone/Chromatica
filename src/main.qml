import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.5

Window {
    id: window

    flags: Qt.FramelessWindowHint

    visible: true
    color: "black"

    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight

    LeftTabBar {

        id: leftTabBar

        width: 75

        anchors { left: parent.left; top: parent.top }

        Rectangle {
            color: "white"
            anchors.fill: parent
        }
    }

    StackLayout {

        currentIndex: leftTabBar.currIndex

        anchors {
            left: leftTabBar.right; top: parent.top; bottom: parent.top; right: parent.right
            margins: 24
        }

        AccountView { id: generalView }

        TasksView { id: anemView }
    }
}
