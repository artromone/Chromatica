import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Window 6.0
import QtQuick.Layouts 6.0

import "left.navig.panel"

Window {

    id: window

    property int iconSize: 50

    visible: true

    width: Screen.desktopAvailableWidth / 3
    minimumWidth: Screen.desktopAvailableWidth / 3
    height: Screen.desktopAvailableHeight / 3
    minimumHeight: Screen.desktopAvailableHeight / 3

    LeftNavigPanel {

        id: leftTabBar

        leftPanelColor: "blue"

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    StackLayout {

        currentIndex: leftTabBar.currentIndex

        anchors {
            left: leftTabBar.right; top: parent.top; bottom: parent.bottom; right: parent.right
            margins: 15
        }

        AccountView { id: accountView }

        TasksView { id: tasksView }

        SettingsView { id: settingsView }
    }
}
