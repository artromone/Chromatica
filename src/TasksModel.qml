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
    ListElement {
        name: qsTr("Do my first task")
        priority: 9999999
        isNote: false
        creationDate: qsTr("12.12.23")
    }
}
