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

            height: column.implicitHeight

            border {
                width: 2
                color: if (model.priority == 4) {"#3d4250"}
                       else if (model.priority == 1) {"#960000"}
                       else if (model.priority == 2) {"#964b00"}
                       else if (model.priority == 3) {"#969600"}
            }
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
                    text: qsTr("Открыть файл")
                    onTriggered: taskModel.openTask(model.file_name)
                }
            }

            Column {

                id: column

                leftPadding: 8
                topPadding: 5
                bottomPadding: 5

                Row {

                    spacing: 8

                    CheckBox { height: 16; width: 16 }

                    Label {

                        width: 165

                        text: model.task_name
                        color: "black"

                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}
