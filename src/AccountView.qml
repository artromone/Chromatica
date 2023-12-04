import QtQuick 2.11

Rectangle {

    id: root

    width: 300
    height: 400

    ListView {
        id: view

        height: root.height

        model: PetsModel{}
        delegate: DragDelegate {}

        spacing: 5
        cacheBuffer: 50
    }
}
