import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    width: 200

    property string boardTitle: ""

    id: tasksView

    Item {

        id: rowContent

        anchors.top: parent.top
        anchors.left: parent.left

        height: 25
        width: 170

        Rectangle {
            anchors.fill: parent

            border { width: 1; color: "gray" }
            radius: 2
        }

        Label {

            id: labelTest

            anchors.fill: parent
            padding: 5

            elide: Text.ElideRight

            color: "black"
            background: Rectangle { color: "gray" }

            text: boardTitle
        }
    }

    Button {

        anchors.top: parent.top
        anchors.left: rowContent.right; anchors.leftMargin: 5

        height: 25
        width: 25

        background: Rectangle { color: "gray" }

        text: "+"

        onClicked: {  }
    }

    ListView {

        id: listView

        clip: true

        anchors.top: rowContent.bottom; anchors.topMargin: 10
        anchors.left: parent.left

        height: tasksView.height
        width: 1000

        model: taskModel
        delegate: TaskDelegate {}

        spacing: 5
        cacheBuffer: 50 // TODO
    }
}
