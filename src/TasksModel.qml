import QtQuick 6.0

ListModel {

    ListElement {
        name: qsTr("Buy yogurt")
        priority: 1
        isNote: true
        creationDate: qsTr("02.06.22")
    }

    ListElement {
        name: qsTr("Feed the cat")
        priority: 3
        isNote: false
        creationDate: qsTr("04.12.23")
    }
}
