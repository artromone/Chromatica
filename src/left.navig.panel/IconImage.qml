import QtQuick 6.0

Image {
    source: Qt.resolvedUrl(sourceUrl)
    sourceSize.width: iconSize
    sourceSize.height: iconSize

    fillMode: Image.PreserveAspectFit
    anchors.fill: parent
}
