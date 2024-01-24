import QtQuick 6.0
import QtQuick.Controls 6.0

TabBar {

    property int panelsNumber
    property color tabBarColor

    implicitHeight: iconSize * panelsNumber
    implicitWidth: iconSize

    background: Rectangle{ color: tabBarColor }

    contentItem: ListView {
        spacing: 0

        model: tabBar.contentModel
        currentIndex: tabBar.currentIndex
        orientation: ListView.Vertical

        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem

        highlightMoveDuration: 0
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: iconSize
        preferredHighlightEnd: height - iconSize
    }
}
