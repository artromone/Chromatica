import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

Item {

    id: leftPanelRow

    property int currIndex: tabBar.currentIndex

    TabBar {

        id: tabBar

        anchors {left: parent.left; top: parent.bottom }

        implicitHeight: 150
        implicitWidth: 75

        contentItem: ListView {
            model: tabBar.contentModel
            currentIndex: tabBar.currentIndex

            spacing: 0 //control.spacing
            orientation: ListView.Vertical
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.AutoFlickIfNeeded
            snapMode: ListView.SnapToItem

            highlightMoveDuration: 0
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: 75
            preferredHighlightEnd: height - 75
        }

        TabButton {
            id: accountButton

            height: 75
            width: 75

            Label {

                text: "ACCNT"

                anchors.fill: parent
            }
        }

        TabButton {
            id: tasksButton

            height: 75
            width: 75

            anchors.top: accountButton.bottom

            Label {

                text: "TASKS"

                anchors.fill: parent
            }
        }
    }
}
