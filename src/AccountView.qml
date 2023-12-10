import QtQuick 6.0
import QtQuick.Controls 6.0
Item {

    id: accountView

    Rectangle
    {
        id: mainRect
        anchors.fill: parent
        color: "gray"
    }


    Rectangle {
            id: rectToList
            anchors { top: parent.top; left: parent.top }
            height: parent.height
            width: 200

            color: "lightgray"

            Button {
                id: buttonToGen
                text: "Generate List"
                onClicked: generateList()
            }
            TextField {
                id: numberInput
                anchors { top: parent.top; left: buttonToGen.right; right: parent.right}
                placeholderText: "Enter a number"
                validator: IntValidator {}
            }
    }
}
