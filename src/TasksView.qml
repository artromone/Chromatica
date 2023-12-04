import QtQuick 6.0

Item {

    id: tasksView

    ListView {

        height: tasksView.height
        width: 1000

        model: TasksModel {}
        delegate: TaskDelegate {}

        spacing: 5
        cacheBuffer: 50 // TODO
    }
}
