#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ListElementsModel.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
    {
        return -1;
    }

    auto taskModel = new ListElementsModel();
    engine.rootContext()->setContextProperty("taskModel", taskModel);

    return app.exec();
}
