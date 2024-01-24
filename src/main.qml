import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Window 6.0
import QtQuick.Layouts 6.0

import "left.navig.panel"
import "views.left.panel/account"
import "views.left.panel/tasks"
import "views.left.panel/settings"

Window {

    id: window
    visible: true
    title: qsTr("Chromatica 24.01.2024 | Artem Romanovich")
    color: "#dae0e2"

    property int iconSize: 50

    width: Screen.desktopAvailableWidth / 3
    height: Screen.desktopAvailableHeight / 3

    minimumWidth: Screen.desktopAvailableWidth / 3
    minimumHeight: Screen.desktopAvailableHeight / 3

    LeftNavigPanel {

        id: leftTabBar

        leftPanelColor: "#3d4250"

        anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
    }

    StackLayout {

        currentIndex: leftTabBar.currentIndex

        anchors {
            left: leftTabBar.right; top: parent.top; bottom: parent.bottom; right: parent.right
            margins: 10
        }

        Item {

            id: saveScreen

            Rectangle {

                color: "#3d4250"
                anchors.fill: parent

                Label {

                    text: qsTr("Chromatica | https://t.me/art_rom")

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Rectangle {

            //     width: 100
            //     height: 100

            //     color: "red"

            //     SequentialAnimation on x {
            //         loops: Animation.Infinite
            //         NumberAnimation { to: saveScreen.width - 100; duration: 3000 }
            //         NumberAnimation { to: 0; duration: 3000 }
            //     }
            // }
        }

        AccountView { id: accountView }

        TasksView { id: tasksView }

        SettingsView { id: settingsView }
    }
}
