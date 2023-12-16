#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "TasksModel.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
    {
        return -1;
    }

    auto taskModel = new TasksModel();
    engine.rootContext()->setContextProperty("taskModel", taskModel);

    return app.exec();
}
