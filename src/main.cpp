#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QQmlContext>
#include <QLockFile>
#include <QIcon>
#include <QDir>

#include "TasksModel.h"

#include "Logger.h"

Logger* Logger::loggerConnection = nullptr;

int main(int argc, char* argv[])
{
    Logger::getConnction();
    QString lockFilePath = QDir::tempPath() + "/Chromatica.lock";
    QLockFile lockFile(lockFilePath);
    if (!lockFile.tryLock())
    {
        qDebug() << "Another instance of the application is already running.";
        return 1;
    }

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("logo.svg"));

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
