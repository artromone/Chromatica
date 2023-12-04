import QtQuick 2.11

Item {

    id: tasksView

    ListView {

        height: tasksView.height

        model: TasksModel {}
        delegate: TaskDelegate {}

        spacing: 5
        cacheBuffer: 50 // TODO
    }
}
