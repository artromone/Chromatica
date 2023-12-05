import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: tasksView

    Board {

        boardTitle: "Stop doing this:"

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }
}
