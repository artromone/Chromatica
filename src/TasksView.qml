import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: tasksView

    Item {

        id: rowContent

        anchors.top: parent.top
        anchors.left: parent.left

        height: 25
        width: 200

        Rectangle {
            anchors.fill: parent

            border { width: 1; color: "gray" }
            radius: 2
        }

        TextField {
            anchors.fill: parent
            padding: 5

            color: "black"
            background: Rectangle { color: "gray" }

            text: "Not sectioned."
        }
    }

    ListView {

        id: listView

        anchors.top: rowContent.bottom; anchors.topMargin: 10
        anchors.left: parent.left

        height: tasksView.height
        width: 1000

        model: TasksModel {}
        delegate: TaskDelegate {}

        spacing: 5
        cacheBuffer: 50 // TODO
    }
}
