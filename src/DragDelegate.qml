import QtQuick 2.11
import QtQuick.Controls 2.1

Item {
    id: dragDelegate

    width: 300
    height: 80

    Rectangle {

        anchors.fill: parent

        width: view.width
        height: column.implicitHeight + 4

        border.width: 1
        border.color: "black"

        radius: 2

        Column {
            id: column

            anchors {
                fill: parent
                margins: 2
            }

            Label { text: qsTr('Name: ') + model.name }
            Label { text: qsTr('Type: ') + model.type }
            Label { text: qsTr('Age: ') + model.age }
            Label { text: qsTr('Size: ') + model.size }
        }
    }
}
