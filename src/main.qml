import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import QtQuick.Layouts 1.5

Window {
    id: window

    property int iconSize: 50

    //flags: Qt.FramelessWindowHint

    visible: true
    color: "white"

    width: Screen.desktopAvailableWidth
    minimumWidth: Screen.desktopAvailableWidth / 3
    height: Screen.desktopAvailableHeight
    minimumHeight: Screen.desktopAvailableHeight / 3

    LeftNavigPanel {

        id: leftTabBar

        width: iconSize

        anchors { left: parent.left; top: parent.top }

        Rectangle {

            color: "white"
            anchors.fill: parent
        }
    }

    StackLayout {

        currentIndex: leftTabBar.currentIndex

        anchors {
            left: leftTabBar.right; top: parent.top; bottom: parent.bottom; right: parent.right
            margins: 15
        }

        AccountView { id: accountView }

        TasksView { id: tasksView }
    }
}
