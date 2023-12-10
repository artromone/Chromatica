import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    function intQ() {
        console.log("@rt1", window.width+=10);
    }

    property string boardTitle: ""

    id: tasksView

    Item {

        id: rowContent

        anchors.top: parent.top
        anchors.left: parent.left

        height: 25
        width: 165

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

            text: boardTitle
        }
    }

    Button {
        anchors.top: parent.top
        anchors.left: rowContent.right; anchors.leftMargin: 10

        height: 25
        width: 25

        background: Rectangle { color: "gray" }

        text: "+"

        onClicked: { intQ() }
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
