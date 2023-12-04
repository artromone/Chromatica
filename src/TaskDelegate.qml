import QtQuick 2.11
import QtQuick.Controls 2.1

Item {
    id: dragDelegate

    width: 200
    height: 75

    MouseArea {
        id: dragArea

        property bool held: false

        anchors {
            left: parent.left
            right: parent.right
        }
        height: content.height

        drag.target: held ? content : undefined
        drag.axis: Drag.YAxis

        onPressAndHold: held = true
        onReleased: held = false

        Rectangle {

            id: content

            anchors.fill: parent
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            width: dragArea.width //
            height: column.implicitHeight + 4 //

            border { width: 1; color: "gray" }
            color: dragArea.held ? "lightgray" : "white"
            radius: 2

            Behavior on color { ColorAnimation { duration: 100 } }
            states: State {
                when: dragArea.held

                ParentChange {
                    target: content
                    parent: root
                }
                AnchorChanges {
                    target: content
                    anchors {
                        horizontalCenter: undefined
                        verticalCenter: undefined
                    }
                }
            }

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
}
