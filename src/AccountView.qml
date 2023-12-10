import QtQuick 6.0
import QtQuick.Controls 6.0
Item {

    id: accountView

    Rectangle
    {
        id: mainRect
        anchors { top: parent; left: parent }
    }


    Rectangle {
            id: rectToList
            anchors { top: parent; left: parent }

            Button {
                id: buttonToGen
                text: "Generate List"
                onClicked: generateList()
            }
    }
}
