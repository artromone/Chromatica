import QtQuick 6.0
import QtQuick.Controls 6.0
import QtQuick.Window 6.0
import QtQuick.Layouts 6.0

import "left.navig.panel"
import "views.left.panel/account"
import "views.left.panel/tasks"
import "views.left.panel/settings"

import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "QML Logger Example"

    Button {
        text: "Log something"
        anchors.centerIn: parent

        onClicked: {
            Logger.getConnction().insertLog("Some log message", " ")
        }
    }
}
