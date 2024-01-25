import QtQuick 6.0
import QtQuick.Controls 6.0

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

            border { width: 2; color: "#3d4250" }
            color: dragArea.held ? "lightblue" : "#dae0e2"
            radius: 5

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

                anchors { fill: parent; margins: 2 }
                padding: 3

                Label { text: qsTr('Task: ') + model.name; color: "black" }
                Label { text: qsTr('Priority: ') + model.priority; color: "black" }
                Label { text: qsTr('Creation date: ') + Qt.formatDateTime(model.creation_date, "yyyy-MM-dd hh:mm"); color: "black" }
            }
        }
    }
}
