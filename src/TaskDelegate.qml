import QtQuick 2.11
import QtQuick.Controls 2.1

Item {
    id: dragDelegate

    width: 300
    height: 75

    Rectangle {

        anchors.fill: parent

        border.width: 1
        border.color: "gray"

        radius: 2

        Column {
            id: column

            anchors {
                fill: parent
                margins: 2
            }

            Label { text: qsTr('Task: ') + model.name }
            Label { text: qsTr('Priority: ') + model.priority }
            Label { text: qsTr('Note?: ') + model.isNote }
            Label { text: qsTr('Creation date: ') + model.creationDate }
        }
    }
}
