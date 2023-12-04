import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Window 6.0
import QtQuick.Layouts 6.0

Window {
    id: window

    property int iconSize: 40

    //flags: Qt.FramelessWindowHint

    visible: true
    color: "white"

    width: Screen.desktopAvailableWidth / 3
    minimumWidth: Screen.desktopAvailableWidth / 3
    height: Screen.desktopAvailableHeight / 3
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
