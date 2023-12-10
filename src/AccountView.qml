import QtQuick 6.0
import QtQuick.Controls 6.0
// отступ
Item {

    id: accountView

    function generateList() { // все функции наверху

        var number = parseInt(numberInput.text)

        intElement.clear()

        for (var i = 0; i < number; ++i) {
            intElement.append({ "modelData": (number) })
        }
    }

    Rectangle {

        id: mainRect

        anchors.fill: parent // отступы лучше делать :)

        color: "gray"
    }

    Rectangle {

        id: rectToList

        // function generateList() { // TODO delete
        //     var number = parseInt(numberInput.text)
        //     listModel.clear()

        //     for (var i = 0; i < number; ++i) {
        //         listModel.append({ "modelData": "Item " + (i + 1) })
        //     }
        // }

        anchors { top: parent.top; left: parent.top }

        height: parent.height
        width: 200

        color: "lightgray"

        Button {

            id: buttonToGen

            text: "Generate List"

            z: 1 // для ... TODO коммент

            onClicked: generateList()
        }

        TextField {

            id: numberInput

            anchors { top: parent.top; left: buttonToGen.right; right: parent.right}

            placeholderText: "Enter a number"
            validator: IntValidator {}
        }

        ListView {

            width: parent.width
            height: parent.height - 40

            anchors {top: buttonToGen.bottom; left: parent.left}

            model: ListModel { id: intElement }

            delegate: Item {

                height: 15

                Rectangle {

                    width: parent.width
                    height: parent.height

                    Text { text: model.modelData }
                }
            }
        }
    }
}
