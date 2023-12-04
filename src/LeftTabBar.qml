import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Item {

    id: leftPanelRow

    property int currIndex: tabBar.currentIndex
    property int tabSpacing: 15

    TabBar {

        id: tabBar

        anchors { left: parent.left; top: parent.bottom }

        implicitHeight: iconSize * 2 /*+ tabSpacing*/
        implicitWidth: iconSize

        contentItem: ListView {

            spacing: tabSpacing

            model: tabBar.contentModel
            currentIndex: tabBar.currentIndex
            orientation: ListView.Vertical

            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.AutoFlickIfNeeded
            snapMode: ListView.SnapToItem

            highlightMoveDuration: tabSpacing
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: iconSize + tabSpacing
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
                sourceSize.width: 500
                sourceSize.height: 500

                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }

        TabButton {

            id: tasksButton

            height: iconSize
            width: iconSize

            anchors { top: accountButton.bottom; /*topMargin: tabSpacing*/ }

            background: Rectangle {
                color: tabBar.currentIndex == 1 ? "gray" : "white"
                radius: iconSize / 2
            }

            Image {

                source: Qt.resolvedUrl("icons/tasks.png")
                sourceSize.width: 500
                sourceSize.height: 500

                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }
    }
}
