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
    qDebug() << "Logger initialized!!" << logFileName;
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
    QFile logFile(logFileName);

    if (logFile.open(QIODevice::WriteOnly | QIODevice::Append | QIODevice::Text))
    {
        QTextStream stream(&logFile);
        stream << QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss")
               <<  "  " + type + "  "
               << data  << "\n";
        logFile.close();
    }
    else
    {
        // Обработка ошибки открытия файла
        qDebug() << "Error opening the log file";
    }

}
