import QtQuick 6.0
import QtQuick.Controls 6.0

TabButton {

    property int buttonIndex
    property url iconSource

    id: button

    height: iconSize
    width: iconSize

    background: Rectangle {
        color: tabBar.currentIndex !== buttonIndex ? "#3d4250" : "#dae0e2"
        radius: button.width / 2
    }

    Image {

        source: Qt.resolvedUrl(iconSource)
        fillMode: Image.PreserveAspectFit

        anchors.fill: parent
        sourceSize.width: button.width
        sourceSize.height: button.height
    }

    onClicked: { tabBar.currentIndex = buttonIndex }
}
