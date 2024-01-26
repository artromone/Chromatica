import QtQuick 6.0
import QtQuick.Controls 6.0

Item {
    id: dragDelegate

    width: 200
    height: content.height

    MouseArea {

        id: dragArea

        anchors { left: parent.left; right: parent.right }
        height: content.height

        Rectangle {

            id: content

            anchors.fill: parent
            anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }

            height: column.implicitHeight + 4

            border { width: 2; color: "#3d4250" }
            color: "#dae0e2"
            radius: 5

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton

                onClicked: menu.popup()
            }

            Menu {

                id: menu

                MenuItem {
                    text: qsTr("Удалить")
                    onTriggered: taskModel.removeTask(model.task_name)
                }

                MenuItem {
                    text: qsTr("Показать в папке")
                    onTriggered: taskModel.openTask(model.file_name)
                }
            }

            Column {
                id: column

                anchors { fill: parent; margins: 2 }
                padding: 3

                Label { text: qsTr("Task: ") + model.task_name; color: "black" }
                Label { text: qsTr("Priority: ") + model.priority; color: "black" }
                Label { text: qsTr("Creation date: ") + Qt.formatDateTime(model.creation_date, "dd.MM.yyyy hh:mm"); color: "black" }
            }
        }
    }
}
