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
    function generateList() {
        var number = parseInt(numberInput.text)
        intElement.clear()

        for (var i = 0; i < number; ++i) {
            intElement.append({ "modelData": (number) })
        }
    }
    Rectangle {
        id: rectToList
        anchors { top: parent.top; left: parent.top }
        height: parent.height
        width: 200

        color: "lightgray"
        function generateList() {
            var number = parseInt(numberInput.text)
            listModel.clear()

            for (var i = 0; i < number; ++i) {
                listModel.append({ "modelData": "Item " + (i + 1) })
            }
        }
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
        ListView {
            width: parent.width
            height: parent.height
            model: ListModel {
                id: intElement
            }
            anchors {top: buttonToGen.bottom; left: parent.left; bottom: parent.bottom}

            delegate: Item {

                height: 15

                Rectangle {
                    width: parent.width
                    height: parent.height

                    Text {
                        text: model.modelData
                    }
                }
            }
        }

    }
}
