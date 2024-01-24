import QtQuick 6.0
import QtQuick.Controls 6.0

Item {

    id: tasksView

    ProgressBar {

        id: progressBar

        indeterminate: true
        visible: false

        height: 5

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ListView {

        // width: 500
        //height: 500

        anchors.topMargin: progressBar.visible ? 10 : 0

        anchors.top: progressBar.visible ? progressBar.bottom : parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        spacing: 10

        ScrollBar.horizontal: ScrollBar {
        }

        Board {

            id: basket
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
