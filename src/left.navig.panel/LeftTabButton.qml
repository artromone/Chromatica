import QtQuick 6.0
import QtQuick.Controls 6.0

TabButton {

    property int buttonIndex
    property url iconSource

    id: button

    height: iconSize
    width: iconSize

    background: Rectangle {
        color: tabBar.currentIndex !== buttonIndex ? "#3d4250" : "#51586b"
        //radius: button.width / 2
    }

    Image {

        source: Qt.resolvedUrl(iconSource + (tabBar.currentIndex !== buttonIndex ? "_black" : "_white") + ".svg")
        fillMode: Image.PreserveAspectFit

        anchors.fill: parent
        sourceSize.width: button.width
        sourceSize.height: button.height
    }

    onClicked: { tabBar.currentIndex = buttonIndex;
                 Logger.getConnction().insertLog("click on left tab button with index " + buttonIndex) }
}
