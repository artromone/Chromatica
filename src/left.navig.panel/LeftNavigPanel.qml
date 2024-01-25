import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: leftNavigPanel

    property int currentIndex: tabBar.currentIndex
    property color leftPanelColor

    width: tabBar.width

    LeftTabBar {

        id: tabBar

        panelsNumber: 3
        tabBarColor: leftPanelColor

        anchors.left: parent.left
        anchors.top: parent.top

        LeftTabButton {

            id: accountButton

            anchors.top: parent.top

            buttonIndex: 1
            iconSource: "icons/account"
        }

        LeftTabButton {

            id: tasksButton

            anchors.top: accountButton.bottom

            buttonIndex: 2
            iconSource: "icons/tasks"
        }

        LeftTabButton {

            id: settingsButton

            anchors.top: tasksButton.bottom

            buttonIndex: 3
            iconSource: "icons/settings"
        }
    }

    Rectangle {

        color: leftPanelColor

        anchors.top: tabBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
