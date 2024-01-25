import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: tasksView

    MouseArea {
        anchors {
            left: tasksList.right; top: parent.top
            bottom: parent.bottom; right: parent.right
        }
        onPressed: taskList.hideTaskEdit()
    }

    ListView {

        id: tasksList

        width: taskList.width

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        spacing: 10

        Board {

            id: taskList
            anchors {top: parent.top; bottom: parent.bottom}

            boardTitle: "Basket"
        }

        // Board {

        //     id: projects
        //     anchors {top: parent.top; bottom: parent.bottom; left: basket.right}

        //     boardTitle: "Project"
        // }

        // Board {

        //     id: backlog
        //     anchors {top: parent.top; bottom: parent.bottom; left: projects.right}

        //     boardTitle: "Backlog"
        // }

        // Board {

        //     id: someday
        //     anchors {top: parent.top; bottom: parent.bottom; left: backlog.right}

        //     boardTitle: "Someday later"
        // }
    }
}
