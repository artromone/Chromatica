import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Item {

    id: leftNavigPanel

    property int currentIndex: tabBar.currentIndex

    TabBar {

        id: tabBar

        anchors { left: parent.left; top: parent.bottom }

        implicitHeight: iconSize * 2
        implicitWidth: iconSize

        contentItem: ListView {

            spacing: 0

            model: tabBar.contentModel
            currentIndex: tabBar.currentIndex
            orientation: ListView.Vertical

            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.AutoFlickIfNeeded
            snapMode: ListView.SnapToItem

            highlightMoveDuration: 0
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: iconSize
            preferredHighlightEnd: height - iconSize
        }

        TabButton {

            id: accountButton

            height: iconSize
            width: iconSize

            background: Rectangle {
                color: tabBar.currentIndex == 0 ? "gray" : "white"
                radius: iconSize / 2
            }

            Image {

                source: Qt.resolvedUrl("icons/account.png")
                sourceSize.width: iconSize
                sourceSize.height: iconSize

                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }

        TabButton {

            id: tasksButton

            height: iconSize
            width: iconSize

            anchors { top: accountButton.bottom; /*topMargin: ...*/ }

            background: Rectangle {
                color: tabBar.currentIndex == 1 ? "gray" : "white"
                radius: iconSize / 2
            }

            Image {

                source: Qt.resolvedUrl("icons/tasks.png")
                sourceSize.width: iconSize
                sourceSize.height: iconSize

                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }
    }
}
