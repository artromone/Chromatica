import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: settingsView

    Rectangle {
        anchors.fill: parent
        color: "#3d4250"
    }

    Row {
        anchors.left: parent.left
        anchors.right: parent.right

        CheckBox {

            property int windowFlags: 0

            text: "Toggle Frameless Window"

            onClicked: {
                if (checked)
                {
                    windowFlags |= Qt.FramelessWindowHint;
                    Logger.getConnction().insertLog("enable frameless window")

                }
                else
                {
                    windowFlags &= ~Qt.FramelessWindowHint;
                    Logger.getConnction().insertLog("disable frameless window")
                }

                window.flags = windowFlags;
            }
        }
    }
}
