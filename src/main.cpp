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
    Logger::getConnction()->insertLog("Prog start");
    QString lockFilePath = QDir::tempPath() + "/Chromatica.lock";
    QLockFile lockFile(lockFilePath);
    if (!lockFile.tryLock())
    {
        qDebug() << "Another instance of the application is already running.";
        Logger::getConnction()->insertLog("trying start another instance of the application", "E");
        return 1;
    }

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("logo.svg"));

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Logger", Logger::getConnction());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
    {
        return -1;
    }

    auto taskModel = new TasksModel();
    engine.rootContext()->setContextProperty("taskModel", taskModel);

    return app.exec();
}
