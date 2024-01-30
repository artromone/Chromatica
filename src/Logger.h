#ifndef LOGGER_H
#define LOGGER_H

#include <QString>

class Logger
{
private:
    Logger();
    static Logger* loggerConnection;
    QString logFileName;
public:
    Logger(const Logger&);
    Logger(Logger&&);
    Logger& operator=(const Logger&);
    Logger& operator=(Logger&&);

    static Logger* getConnction();
};

#endif // LOGGER_H
