#include "Logger.h"

#include <QDebug>

Logger::Logger()
{
    qDebug() << "Logger initialized";
}


Logger* Logger::getConnction()
{
    if (Logger::loggerConnection == nullptr)
    {
        Logger::loggerConnection = new Logger();
    }
    return Logger::loggerConnection;
}
