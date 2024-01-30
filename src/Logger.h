#ifndef LOGGER_H
#define LOGGER_H

#include <QString>
#include <QFile>

class Logger
{
private:
    Logger();
    static Logger* loggerConnection;
    QString logFileName;
    QFile logFile;
public:
    Logger(const Logger&);
    Logger(Logger&&);
    Logger& operator=(const Logger&);
    Logger& operator=(Logger&&);

    static Logger* getConnction();
    void insertLog(QString data, QString type = " ");
};

#endif // LOGGER_H
