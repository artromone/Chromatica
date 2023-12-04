import QtQuick 2.11

Rectangle {
    id: root

    width: 300
    height: 400

    Item {
        id: dragDelegate

        Rectangle {
            id: content

            property string name: ""
            property string type: ""
            property string size: ""
            property int age: 0

            width: view.width
            height: column.implicitHeight + 4

            border.width: 1
            border.color: "lightsteelblue"

            radius: 2

            Column {
                id: column
                anchors {
                    fill: parent
                    margins: 2
                }

                Text { text: qsTr('Name: ') + content.name }
                Text { text: qsTr('Type: ') + content.type }
                Text { text: qsTr('Age: ') + content.age }
                Text { text: qsTr('Size: ') + content.size }
            }
        }
    }
    ListView {
        id: view

        anchors {
            fill: parent
            margins: 2
        }

        //model: PetsModel {}
        delegate: dragDelegate

        spacing: 4
        cacheBuffer: 50
    }
}
