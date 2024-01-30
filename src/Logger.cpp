#include "Logger.h"

#include <QDebug>
#include <QString>
#include <QDateTime>

Logger::Logger()
{
    logFileName = QDateTime::currentDateTime().toString("yyyy-MM-dd HH:mm:ss");
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
