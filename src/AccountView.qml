import QtQuick 6.0

Item {

    id: accountView

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "gray"
        Rectangle {
            anchors.left: parent; anchors.top: parent
            width: 100; height: 50
            color: "lightgray"

            Text {
                text: "ono rabotaet"
                anchors.horizontalCenter: parent
                font.pointSize: 10;
            }
        }
    }
}
