import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: settingsView

    Rectangle {
        anchors.fill: parent
        color: "#3d4250"

        CheckBox {
            property int windowFlags: 0

            anchors.centerIn: parent
            text: "Toggle Frameless Window"

            onClicked: {
                if (checked) {
                    // Включить Qt.FramelessWindowHint
                    windowFlags |= Qt.FramelessWindowHint;
                } else {
                    // Выключить Qt.FramelessWindowHint
                    windowFlags &= ~Qt.FramelessWindowHint;
                }

                window.flags = windowFlags;
            }
        }
    }
}
