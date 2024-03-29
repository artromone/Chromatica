import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    width: 200

    property string boardTitle: ""

    id: tasksView

    function hideTaskEdit()  {
        newTaskEdit.visible = false
    }

    MouseArea {
        anchors.fill: parent
        onPressed: hideTaskEdit()
    }

    Item {

        id: rowContent

        anchors.top: parent.top
        anchors.left: parent.left

        height: 25
        width: 170

        Label {

            id: labelTest

            anchors.fill: parent
            padding: 5

            elide: Text.ElideRight

            color: "#dae0e2"
            background: Rectangle { color: "#3d4250"; radius: 3 }

            text: boardTitle
        }
    }

    Button {

        anchors.top: parent.top
        anchors.left: rowContent.right; anchors.leftMargin: 5

        height: 25
        width: 25

        background: Rectangle { color: "#3d4250"; radius: 3 }

        text: "+"

        onClicked: newTaskEdit.visible = true
    }

    TextField {

        id: newTaskEdit

        visible: false

        anchors {
            top: rowContent.bottom; left: parent.left; right: parent.right
            topMargin: 10
        }

        color: "black"
        padding: 5

        background: Rectangle {
            border { width: 2; color: "#3d4250" }
            radius: 5
            color: "#dae0e2"
        }

        onAccepted: {
            newTaskEdit.focus = false

            taskModel.addTask(text)
            visible = false
        }
    }

    Flickable {

        id: flickable

        clip: true

        anchors.top: (newTaskEdit.visible ? newTaskEdit.bottom : rowContent.bottom)
        anchors.topMargin: 10
        anchors.left: parent.left

        width: 200
        height: contentHeight
        contentHeight: taskColumn.height + taskColumn.spacing

        Column {

            id: taskColumn

            width: flickable.width
            spacing: 5

            Repeater {
                model: taskModel
                delegate: TaskDelegate {}
            }
        }
    }
}
