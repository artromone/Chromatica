#include "Logger.h"

#include <QDebug>
#include <QString>
#include <QDateTime>
#include <QFile>
#include <QDir>
#include <QStandardPaths>

QString logsDirPath() {

    QString dirPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/Chromatica/logs";

    QDir dir(dirPath);
    if (!dir.exists())
    {
        dir.mkpath(dirPath);
    }

    return dirPath;
}

Logger::Logger()
{
    logFileName =  logsDirPath() + "/" + QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");
    logFile.setFileName(logFileName);
    logFile.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text);
    qDebug() << "@nik Logger initialized!!" << logFileName;
}

Logger::~Logger()
{
    insertLog("prog finish");
    qDebug() << "@nik Logger dead";
    delete loggerConnection;
}


Logger* Logger::getConnction()
{
    if (Logger::loggerConnection == nullptr)
    {
        Logger::loggerConnection = new Logger();
    }
    return Logger::loggerConnection;
}

void Logger::insertLog(QString data, QString type)
{
    QTextStream stream(&logFile);
    stream << QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss")
           <<  "  " + type + "  "
           << data  << "\n";

    qDebug() << "@nik" << QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss")
             <<  "  " + type + "  "
             << data  << "\n";
}
